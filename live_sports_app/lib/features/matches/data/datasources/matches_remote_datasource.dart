import 'dart:math';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/entities/match.dart';
import '../../../sports/domain/entities/sport.dart';
import '../../domain/repositories/matches_repository.dart';
import '../models/espn/espn_models.dart';
import '../models/match_event_commentary.dart';
import '../models/match_model.dart';
import '../models/team_model.dart';

abstract class MatchesRemoteDataSource {
  Future<List<MatchModel>> getLiveMatches({String? sportId});
  Future<List<MatchModel>> getLiveMatchesByLeague(String leagueId,
      {String? sportId});
  Future<List<MatchModel>> getPastMatches({
    required PaginationParams pagination,
    MatchFilters filters,
  });
  Future<List<MatchModel>> getScheduledMatches({
    required PaginationParams pagination,
    MatchFilters filters,
  });
  Future<List<MatchModel>> getMatchesByDate(DateTime date);
  Future<MatchModel> getMatchById(String matchId);
  Future<List<MatchEventModel>> getMatchEvents(String matchId);
  Future<List<CommentaryModel>> getMatchCommentary(String matchId,
      {int? since});
}

class MatchesRemoteDataSourceImpl implements MatchesRemoteDataSource {
  MatchesRemoteDataSourceImpl({required DioClient dioClient})
      : _dio = dioClient;

  final DioClient _dio;
  static final RegExp _espnScoreboardEndpointPattern =
    RegExp(r'/sports/([^/]+)/([^/]+)/scoreboard');
  static final RegExp _espnEventPathPattern =
    RegExp(r'/sports/([^/]+)/([^/]+)/');
  static final RegExp _digitsPattern = RegExp(r'(\d+)');

  // In-memory caches populated as a side-effect of every scoreboard fetch.
  // This avoids redundant HTTP round-trips when opening match detail or commentary.
  final _matchCache = <String, MatchModel>{};
  Map<String, _EspnEventMeta>? _metaIndexCache;
  DateTime? _metaIndexCachedAt;
  static const _metaIndexTtl = Duration(minutes: 10);

  @override
  Future<List<MatchModel>> getLiveMatches({String? sportId}) async {
    final endpoints = _resolveEspnEndpoints(sportId);

    // First: fetch without a date filter — ESPN returns the current tournament
    // week by default, which is exactly what the Live tab needs.
    final current = await _fetchCurrentScoreboards(endpoints, sportId: sportId);
    if (current.isNotEmpty) return current;

    // Fallback: some endpoints only respond to explicit date queries.
    final expanded = await _collectEspnMatches(
      fromOffsetDays: -7,
      toOffsetDays: 7,
      sportId: sportId,
      baseDate: DateTime.now().toUtc(),
      endpoints: endpoints,
    );
    return expanded.toList(growable: false);
  }

  /// Fetches all sport endpoints without a date query and collects results.
  /// ESPN scoreboard endpoints default to the current/upcoming week of events.
  Future<List<MatchModel>> _fetchCurrentScoreboards(
    List<String> endpoints, {
    String? sportId,
  }) async {
    final expectedSport = sportId != null ? _canonicalSportId(sportId) : null;
    final seen = <String>{};
    final all = <MatchModel>[];

    final scoreboards = await Future.wait(
      endpoints
          .map((ep) => _fetchEspnScoreboardForDate(endpoint: ep))
          .toList(growable: false),
    );

    for (var i = 0; i < endpoints.length; i++) {
      final endpointPath = _parseEspnEndpointPath(endpoints[i]);
      print('Current scoreboard ${endpoints[i]}: ${scoreboards[i].events.length} events');
      for (final rawEvent in scoreboards[i].events) {
        try {
          final metaPath = endpointPath ?? _pathFromEspnEvent(rawEvent);
          if (metaPath != null) {
            _metaIndexCache ??= {};
            _metaIndexCache!.putIfAbsent(
              rawEvent.id,
              () => _EspnEventMeta(
                eventId: rawEvent.id,
                sportPath: metaPath.sportPath,
                leaguePath: metaPath.leaguePath,
              ),
            );
            _metaIndexCachedAt ??= DateTime.now().toUtc();
          }

          final normalizedSport = expectedSport ?? _sportIdFromEspnEvent(rawEvent);
          if (sportId != null &&
              sportId.isNotEmpty &&
              normalizedSport != _canonicalSportId(sportId)) {
            continue;
          }

          final mapped = _mapEspnEventToMatch(rawEvent, sportId: normalizedSport);
          if (mapped.id.isEmpty || seen.contains(mapped.id)) continue;
          seen.add(mapped.id);
          all.add(mapped);
          _matchCache[mapped.id] = mapped;
          print('  ✓ Current: ${mapped.id} (${mapped.homeTeam.name} vs ${mapped.awayTeam.name})');
        } catch (e) {
          print('  ✗ Parse error for event ${rawEvent.id}: $e');
          continue;
        }
      }
    }

    return all;
  }

  @override
  Future<List<MatchModel>> getLiveMatchesByLeague(String leagueId,
      {String? sportId}) async {
    // Try cache first — avoid a full re-fetch just for a league filter.
    final canonical = sportId != null ? _canonicalSportId(sportId) : null;
    if (_matchCache.isNotEmpty) {
      final sportMatches = _matchCache.values
          .where((m) => canonical == null || m.sportId == canonical)
          .toList(growable: false);
      if (sportMatches.isNotEmpty) {
        return _filterByLeagueName(sportMatches, leagueId);
      }
    }

    // Cache miss — fetch current scoreboard then filter in memory.
    final endpoints = _resolveEspnEndpoints(sportId);
    final all = await _fetchCurrentScoreboards(endpoints, sportId: sportId);
    return _filterByLeagueName(all, leagueId);
  }

  /// Filters [matches] by [leagueId] using case-insensitive substring matching.
  /// Falls back to the full list when no match is found so the screen is never
  /// left empty due to a league-name mismatch between TheSportsDB and ESPN.
  List<MatchModel> _filterByLeagueName(List<MatchModel> matches, String leagueId) {
    if (leagueId.isEmpty) return matches;
    final ll = leagueId.toLowerCase();
    final filtered = matches.where((m) {
      final ml = m.leagueId.toLowerCase();
      return ml.isNotEmpty && (ml.contains(ll) || ll.contains(ml));
    }).toList(growable: false);
    return filtered.isNotEmpty ? filtered : matches;
  }

  bool _leagueNameMatches(String matchLeagueId, String filterLeagueId) {
    if (filterLeagueId.isEmpty) return true;
    final ml = matchLeagueId.toLowerCase();
    final fl = filterLeagueId.toLowerCase();
    return ml.isNotEmpty && (ml.contains(fl) || fl.contains(ml));
  }

  @override
  Future<List<MatchModel>> getPastMatches({
    required PaginationParams pagination,
    MatchFilters filters = const MatchFilters(),
  }) async {
    final all = await _getResultsWindow(sportId: filters.sportId);

    var filtered = _applyFilters(all, filters)
        .where((match) => match.status == MatchStatus.finished)
        .toList(growable: false);

    if (filtered.isEmpty && filters.sportId != null) {
      filtered = _applyFilters(all, filters, applySportFilter: false)
          .where((match) => match.status == MatchStatus.finished)
          .toList(growable: false);
    }

    filtered.sort((a, b) => b.scheduledAt.compareTo(a.scheduledAt));
    return _paginate(filtered, pagination);
  }

  @override
  Future<List<MatchModel>> getScheduledMatches({
    required PaginationParams pagination,
    MatchFilters filters = const MatchFilters(),
  }) async {
    final all = await _getResultsWindow(sportId: filters.sportId);

    var filtered = _applyFilters(all, filters)
        .where((match) => match.status == MatchStatus.scheduled)
        .toList(growable: false);

    if (filtered.isEmpty && filters.sportId != null) {
      filtered = _applyFilters(all, filters, applySportFilter: false)
          .where((match) => match.status == MatchStatus.scheduled)
          .toList(growable: false);
    }

    filtered.sort((a, b) => a.scheduledAt.compareTo(b.scheduledAt));
    return _paginate(filtered, pagination);
  }

  @override
  Future<List<MatchModel>> getMatchesByDate(DateTime date) async {
    final target =
        DateTime.utc(date.toUtc().year, date.toUtc().month, date.toUtc().day);
    final all = await _collectEspnMatches(
      fromOffsetDays: 0,
      toOffsetDays: 0,
      baseDate: target,
    );
    var results = all
        .where((match) => _isSameUtcDay(match.scheduledAt, target))
        .toList(growable: false);

    // If no matches were found for the exact date, search a nearby window and
    // return matches from the nearest non-empty day. This provides useful
    // fallback content instead of an empty list when APIs report nearby days.
    if (results.isEmpty) {
      final expanded = await _collectEspnMatches(
        fromOffsetDays: -3,
        toOffsetDays: 3,
        baseDate: target,
      );
      if (expanded.isNotEmpty) {
        // Group by UTC day and pick the group whose day is closest to target.
        final groups = <DateTime, List<MatchModel>>{};
        for (final m in expanded) {
          final day = DateTime.utc(m.scheduledAt.year, m.scheduledAt.month, m.scheduledAt.day);
          groups.putIfAbsent(day, () => []).add(m);
        }
        DateTime? bestDay;
        var bestDistance = double.infinity;
        for (final day in groups.keys) {
          final dist = (day.difference(target).inDays).abs().toDouble();
          if (dist < bestDistance) {
            bestDistance = dist;
            bestDay = day;
          }
        }
        if (bestDay != null) results = groups[bestDay]!.toList(growable: false);
      }
    }

    return results;
  }

  @override
  Future<MatchModel> getMatchById(String matchId) async {
    if (_matchCache.containsKey(matchId)) return _matchCache[matchId]!;

    if (_isEspnMatchId(matchId)) {
      // Narrow window first — covers the vast majority of use-cases
      final narrow = await _collectEspnMatches(
        fromOffsetDays: -1,
        toOffsetDays: 1,
      );
      final found = narrow.where((m) => m.id == matchId).toList(growable: false);
      if (found.isNotEmpty) return found.first;

      // Wider fallback for past/future matches
      final wide = await _collectEspnMatches(
        fromOffsetDays: -7,
        toOffsetDays: 7,
      );
      final foundWide = wide.where((m) => m.id == matchId).toList(growable: false);
      if (foundWide.isNotEmpty) return foundWide.first;

      throw StateError('Match not found: $matchId');
    }

    throw StateError(
        'Non-ESPN matches are not supported. Use ESPN match IDs (espn_*)');
  }

  @override
  Future<List<MatchEventModel>> getMatchEvents(String matchId) async {
    // ESPN matches don't expose timeline events, only commentary
    return const <MatchEventModel>[];
  }

  @override
  Future<List<CommentaryModel>> getMatchCommentary(String matchId,
      {int? since}) async {
    final espn = await _fetchEspnSummaryCommentary(matchId, since: since);
    return espn;
  }

  Future<List<CommentaryModel>> _fetchEspnSummaryCommentary(
    String matchId, {
    int? since,
  }) async {
    try {
      final meta = await _getEspnMeta(matchId);
      if (meta == null) return const <CommentaryModel>[];

      final uri = Uri.https(
        'site.api.espn.com',
        '/apis/site/v2/sports/${meta.sportPath}/${meta.leaguePath}/summary',
        {'event': meta.eventId},
      );

      final response =
          await _dio.instance.get<Map<String, dynamic>>(uri.toString());
      if (response.data == null) return const <CommentaryModel>[];

      final raw = response.data!;
      final summaryResponse = EspnSummaryResponse.fromJson(raw);
      final items = _extractEspnCommentaryItems(summaryResponse, raw);
      if (items.isEmpty) return const <CommentaryModel>[];

      final commentary = <CommentaryModel>[];
      for (var index = 0; index < items.length; index++) {
        final mapped = _mapEspnCommentaryItem(items[index],
            matchId: matchId, index: index);
        if (since == null || mapped.minute > since) {
          commentary.add(mapped);
        }
      }

      commentary.sort((a, b) => b.minute.compareTo(a.minute));
      return commentary;
    } catch (_) {
      return const <CommentaryModel>[];
    }
  }

  Future<_EspnEventMeta?> _getEspnMeta(String matchId) async {
    final rawId = matchId.replaceFirst('espn_', '').trim();
    if (rawId.isEmpty) return null;
    final index = await _buildEspnMetaIndex();
    return index[rawId];
  }

  List<EspnCommentaryItem> _extractEspnCommentaryItems(
      EspnSummaryResponse data, Map<String, dynamic> raw) {
    final items = <EspnCommentaryItem>[];

    // article.commentary / article.items
    final article = data.article;
    if (article != null) {
      if (article.commentary.isNotEmpty) items.addAll(article.commentary);
      if (article.items.isNotEmpty) items.addAll(article.items);
    }

    // root commentary array
    if (data.commentary.isNotEmpty) items.addAll(data.commentary);

    // plays / keyPlays (play-by-play present in most ESPN sports)
    for (final key in const ['plays', 'keyPlays', 'playByPlay']) {
      final plays = raw[key];
      if (plays is List) {
        for (final play in plays) {
          if (play is! Map) continue;
          final p = play.cast<String, dynamic>();
          try {
            items.add(EspnCommentaryItem.fromJson(p));
          } catch (_) {
            // Build a minimal item from common play fields
            final text = (p['text'] ?? p['shortText'] ?? p['description'] ?? '').toString();
            if (text.isNotEmpty) {
              items.add(EspnCommentaryItem(
                id: (p['id'] ?? p['playId'] ?? '').toString(),
                text: text,
                minute: (p['period']?['number'] as num?)?.toInt() ?? 0,
                scoringPlay: p['scoringPlay'] == true,
              ));
            }
          }
        }
      }
    }

    // Deduplicate by id
    final seen = <String>{};
    return items.where((item) {
      final id = item.id ?? '';
      if (id.isEmpty) return true;
      return seen.add(id);
    }).toList(growable: false);
  }

  CommentaryModel _mapEspnCommentaryItem(
    EspnCommentaryItem raw, {
    required String matchId,
    required int index,
  }) {
    final id =
        raw.id ?? raw.playId ?? raw.sequence?.toString() ?? index.toString();
    final text =
        raw.text ?? raw.shortText ?? raw.headline ?? raw.description ?? '';
    final minute = raw.minute ?? 0;
    final type = (raw.type ?? raw.typeText ?? '').toLowerCase();
    final loweredText = (raw.text ?? raw.shortText ?? '').toLowerCase();
    final isKey = raw.scoringPlay ||
        raw.scoreValue != null ||
        type.contains('goal') ||
        type.contains('score') ||
        loweredText.contains('goal') ||
        loweredText.contains('scores');
    final publishedAt = DateTime.tryParse(
      raw.timestamp ?? raw.date ?? raw.created ?? raw.time?.date ?? '',
    )?.toUtc();

    return CommentaryModel(
      id: 'espn_${matchId}_$id',
      matchId: matchId,
      minute: minute,
      text: text.isEmpty ? 'Live update.' : text,
      isKeyEvent: isKey,
      publishedAt: publishedAt,
    );
  }

  Future<List<MatchModel>> _getResultsWindow({String? sportId}) async {
    final dated = await _collectEspnMatches(
      fromOffsetDays: -14,
      toOffsetDays: 14,
      sportId: sportId,
    );
    if (dated.isNotEmpty) return dated;

    // Fallback for endpoints that ignore the ?dates= parameter (e.g. tennis).
    // The no-date scoreboard returns the current week, which covers most
    // live, recent-past and near-future matches for those sports.
    final endpoints = _resolveEspnEndpoints(sportId);
    return _fetchCurrentScoreboards(endpoints, sportId: sportId);
  }

  Future<EspnScoreboardResponse> _fetchEspnScoreboardForDate({
    required String endpoint,
    String? dateQuery,
  }) async {
    try {
      final uri = dateQuery != null
          ? Uri.parse(endpoint).replace(queryParameters: {'dates': dateQuery})
          : Uri.parse(endpoint);
      print('MatchesRemoteDataSource GET $uri');
      final response = await _dio.instance.get<Map<String, dynamic>>(
        uri.toString(),
      );
      if (response.data == null) {
        print('  → Response data is null');
        return const EspnScoreboardResponse();
      }
      final raw = response.data!;
      // Log the top-level keys so we can see the response shape for each sport.
      print('  → Keys: ${raw.keys.toList()}'
          ' events=${raw['events'] is List ? (raw['events'] as List).length : 'n/a'}'
          ' sports=${raw['sports'] is List ? (raw['sports'] as List).length : 'n/a'}'
          ' leagues=${raw['leagues'] is List ? (raw['leagues'] as List).length : 'n/a'}');
      final parsed = EspnScoreboardResponse.fromJson(raw);
      print('  → Parsed ${parsed.events.length} events from response');
      return parsed;
    } catch (e) {
      print('  → Error fetching ESPN scoreboard: $e');
      return const EspnScoreboardResponse();
    }
  }

  Future<Map<String, _EspnEventMeta>> _buildEspnMetaIndex() async {
    // Return cached index if still fresh — avoids 130 redundant HTTP requests.
    final now = DateTime.now().toUtc();
    final cached = _metaIndexCache;
    final builtAt = _metaIndexCachedAt;
    if (cached != null && builtAt != null && now.difference(builtAt) < _metaIndexTtl) {
      return cached;
    }

    final index = <String, _EspnEventMeta>{};
    final endpoints = _resolveEspnEndpoints(null);
    final seedDate = now;

    for (var offset = -2; offset <= 10; offset++) {
      final day = seedDate.add(Duration(days: offset));
      final dateQuery = _formatEspnDate(day);

      final scoreboards = await Future.wait(
        endpoints
            .map(
              (endpoint) => _fetchEspnScoreboardForDate(
                endpoint: endpoint,
                dateQuery: dateQuery,
              ),
            )
            .toList(growable: false),
      );

      for (var indexPosition = 0; indexPosition < endpoints.length; indexPosition++) {
        final endpoint = endpoints[indexPosition];
        final endpointPath = _parseEspnEndpointPath(endpoint);
        for (final rawEvent in scoreboards[indexPosition].events) {
          final path = endpointPath ?? _pathFromEspnEvent(rawEvent);
          if (path == null) continue;
          index.putIfAbsent(
            rawEvent.id,
            () => _EspnEventMeta(
              eventId: rawEvent.id,
              sportPath: path.sportPath,
              leaguePath: path.leaguePath,
            ),
          );
        }
      }
    }

    _metaIndexCache = index;
    _metaIndexCachedAt = now;
    return index;
  }

  Future<List<MatchModel>> _collectEspnMatches({
    required int fromOffsetDays,
    required int toOffsetDays,
    String? sportId,
    DateTime? baseDate,
    List<String>? endpoints,
  }) async {
    final resolvedEndpoints = endpoints ?? _resolveEspnEndpoints(sportId);
    final seedDate = (baseDate ?? DateTime.now().toUtc()).toUtc();
    final seen = <String>{};
    final all = <MatchModel>[];
    // If we're requesting a specific sport, trust that the endpoint will return that sport
    final expectedSport = sportId != null ? _canonicalSportId(sportId) : null;

    print('_collectEspnMatches: sportId=$sportId, expectedSport=$expectedSport, endpoints=${resolvedEndpoints.length}, range=$fromOffsetDays to $toOffsetDays');

    for (var offset = fromOffsetDays; offset <= toOffsetDays; offset++) {
      final day = seedDate.add(Duration(days: offset));
      final dateQuery = _formatEspnDate(day);

      final scoreboardsByEndpoint = await Future.wait(
        resolvedEndpoints
            .map((endpoint) => _fetchEspnScoreboardForDate(
                endpoint: endpoint, dateQuery: dateQuery))
            .toList(growable: false),
      );

      for (var index = 0; index < resolvedEndpoints.length; index++) {
        final events = scoreboardsByEndpoint[index].events;
        final endpointPath = _parseEspnEndpointPath(resolvedEndpoints[index]);
        print('Endpoint $index: ${resolvedEndpoints[index]} has ${events.length} events');
        for (final rawEvent in events) {
          try {
            // Populate meta index as a side-effect so commentary lookup is instant.
            final metaPath = endpointPath ?? _pathFromEspnEvent(rawEvent);
            if (metaPath != null) {
              _metaIndexCache ??= {};
              _metaIndexCache!.putIfAbsent(
                rawEvent.id,
                () => _EspnEventMeta(
                  eventId: rawEvent.id,
                  sportPath: metaPath.sportPath,
                  leaguePath: metaPath.leaguePath,
                ),
              );
              _metaIndexCachedAt ??= DateTime.now().toUtc();
            }

            final normalizedSport =
                expectedSport ?? _sportIdFromEspnEvent(rawEvent);
            if (sportId != null &&
                sportId.isNotEmpty &&
                normalizedSport != _canonicalSportId(sportId)) {
              print('  Skipping event ${rawEvent.id}: sport mismatch (expected $sportId, got $normalizedSport)');
              continue;
            }

            final mapped =
                _mapEspnEventToMatch(rawEvent, sportId: normalizedSport);
            if (mapped.id.isEmpty || seen.contains(mapped.id)) {
              if (mapped.id.isEmpty) print('  Skipping event: empty ID');
              if (seen.contains(mapped.id)) print('  Skipping duplicate event ${mapped.id}');
              continue;
            }
            seen.add(mapped.id);
            all.add(mapped);
            _matchCache[mapped.id] = mapped;
            print('  ✓ Added match: ${mapped.id} (${mapped.homeTeam.name} vs ${mapped.awayTeam.name}, status=${mapped.status.name})');
          } catch (error, stackTrace) {
            print('Failed to parse ESPN event ${rawEvent.id}: $error');
            print(stackTrace);
            continue;
          }
        }
      }
    }

    print('_collectEspnMatches result: ${all.length} total matches collected');
    return all;
  }

  List<String> _resolveEspnEndpoints(String? sportId) {
    if (sportId != null && sportId.isNotEmpty) {
      final canonical = _canonicalSportId(sportId);
      final list = ApiConstants.espnLiveEndpointsBySport[canonical];
      if (list != null && list.isNotEmpty) return list;
    }

    return ApiConstants.espnLiveEndpointsBySport.values
        .expand((urls) => urls)
        .toSet()
        .toList(growable: false);
  }

  List<MatchModel> _applyFilters(
    List<MatchModel> items,
    MatchFilters filters, {
    bool applySportFilter = true,
  }) {
    return items.where((match) {
      final withinFrom =
          filters.from == null || !match.scheduledAt.isBefore(filters.from!);
      final withinTo =
          filters.to == null || !match.scheduledAt.isAfter(filters.to!);
      final leagueMatch = filters.leagueId == null ||
          _leagueNameMatches(match.leagueId, filters.leagueId!);
      final teamMatch = filters.teamId == null ||
          match.homeTeam.id == filters.teamId ||
          match.awayTeam.id == filters.teamId;
      final sportMatch = !applySportFilter ||
          filters.sportId == null ||
          match.sportId == _canonicalSportId(filters.sportId!);
      final roundMatch = filters.round == null || match.round == filters.round;
      return withinFrom &&
          withinTo &&
          leagueMatch &&
          teamMatch &&
          sportMatch &&
          roundMatch;
    }).toList(growable: false);
  }

  List<MatchModel> _paginate(
      List<MatchModel> items, PaginationParams pagination) {
    final start = max(0, (pagination.page - 1) * pagination.perPage);
    if (start >= items.length) return const [];
    final end = min(items.length, start + pagination.perPage);
    return items.sublist(start, end);
  }

  _EspnEndpointPath? _parseEspnEndpointPath(String endpoint) {
    final match = _espnScoreboardEndpointPattern.firstMatch(endpoint);
    if (match == null) return null;
    return _EspnEndpointPath(
      sportPath: match.group(1)!,
      leaguePath: match.group(2)!,
    );
  }

  _EspnEndpointPath? _pathFromEspnEvent(EspnEvent rawEvent) {
    final links = rawEvent.links;
    for (final link in links) {
      final href = link.href ?? '';
      final match = _espnEventPathPattern.firstMatch(href);
      if (match != null) {
        return _EspnEndpointPath(
          sportPath: match.group(1)!,
          leaguePath: match.group(2)!,
        );
      }
    }

    final sportSlug = rawEvent.sport?.slug;
    final leagueSlug = rawEvent.league?.slug;
    if (sportSlug != null &&
        sportSlug.isNotEmpty &&
        leagueSlug != null &&
        leagueSlug.isNotEmpty) {
      return _EspnEndpointPath(
        sportPath: sportSlug,
        leaguePath: leagueSlug,
      );
    }

    return null;
  }

  String _formatEspnDate(DateTime date) {
    final utc = date.toUtc();
    final month = utc.month.toString().padLeft(2, '0');
    final day = utc.day.toString().padLeft(2, '0');
    return '${utc.year}$month$day';
  }

  static bool _isSameUtcDay(DateTime a, DateTime b) {
    final left = a.toUtc();
    final right = b.toUtc();
    return left.year == right.year &&
        left.month == right.month &&
        left.day == right.day;
  }

  static int? _parseEspnElapsed(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    final segments = raw.split(':');
    if (segments.isNotEmpty) {
      final minute = int.tryParse(segments.first);
      if (minute != null) return minute;
    }

    final regexpMatch = _digitsPattern.firstMatch(raw);
    if (regexpMatch == null) return null;
    return int.tryParse(regexpMatch.group(1)!);
  }

  static bool _isEspnMatchId(String matchId) => matchId.startsWith('espn_');

  MatchModel _mapEspnEventToMatch(
    EspnEvent rawEvent, {
    required String sportId,
  }) {
    final competitions = rawEvent.competitions;
    final competition = competitions.isNotEmpty ? competitions.first : null;
    final competitors = competition?.competitors ?? [];

    EspnCompetitor? home;
    EspnCompetitor? away;
    try {
      home = competitors.firstWhere(
        (c) => (c.homeAway ?? '').toLowerCase() == 'home',
      );
    } catch (_) {
      home = competitors.isNotEmpty ? competitors.first : null;
    }
    try {
      away = competitors.firstWhere(
        (c) => (c.homeAway ?? '').toLowerCase() == 'away',
      );
    } catch (_) {
      away = competitors.length > 1 ? competitors[1] : null;
    }

    final scheduledAt =
        DateTime.tryParse(rawEvent.date)?.toUtc() ?? DateTime.now().toUtc();

    final status = rawEvent.status;
    final statusType = status.type;
    final statusName = (statusType?.name ?? '').toLowerCase();
    final completed = statusType?.completed ?? false;
    final elapsed = _parseEspnElapsed(
      status.displayClock ?? status.detail,
    );

    final matchStatus = completed
        ? MatchStatus.finished
        : (statusName == 'status_in_progress' || statusName.contains('in'))
            ? MatchStatus.live
            : MatchStatus.scheduled;

    final league = rawEvent.league;
    final leagueId = (league?.name ??
            league?.slug ??
            competition?.type?.name ??
            competition?.type?.abbreviation ??
            league?.id ??
            competition?.id ??
            '')
        .toString();

    var homeTeam = _espnCompetitorToTeam(home);
    var awayTeam = _espnCompetitorToTeam(away);

    // Last-resort fallback: parse "Player A vs. Player B" from the event title.
    // Covers individual sports (tennis, golf) where competitor parsing may fail.
    if (homeTeam.name == 'Unknown' || awayTeam.name == 'Unknown') {
      for (final sep in const [' vs. ', ' vs ']) {
        if (rawEvent.name.contains(sep)) {
          final parts = rawEvent.name.split(sep);
          if (parts.length >= 2) {
            if (homeTeam.name == 'Unknown') {
              homeTeam = homeTeam.copyWith(name: parts.first.trim());
            }
            if (awayTeam.name == 'Unknown') {
              awayTeam = awayTeam.copyWith(name: parts.last.trim());
            }
          }
          break;
        }
      }
    }

    return MatchModel(
      id: 'espn_${rawEvent.id}',
      leagueId: leagueId,
      sportType: SportType.fromApiValue(sportId),
      homeTeam: homeTeam,
      awayTeam: awayTeam,
      scheduledAt: scheduledAt,
      status: matchStatus,
      homeScore: home?.score?.toString(),
      awayScore: away?.score?.toString(),
      elapsed: elapsed,
      venue: competition?.venue?.fullName,
      round: competition?.type?.abbreviation,
    );
  }

  TeamModel _espnCompetitorToTeam(EspnCompetitor? raw) {
    if (raw == null) {
      return TeamModel(
        id: '',
        name: 'Unknown',
        shortName: null,
        logoUrl: null,
      );
    }

    final team = raw.team;
    final logos = team.logos;

    return TeamModel(
      id: team.id.isEmpty ? raw.id : team.id,
      name: team.displayName ??
          team.name ??
          team.shortDisplayName ??
          team.abbreviation ??
          'Unknown',
      shortName: team.shortDisplayName ?? team.abbreviation,
      logoUrl: (logos.isNotEmpty ? logos.first.href : null) ?? '',
    );
  }

  String _sportIdFromEspnEvent(EspnEvent rawEvent) {
    final sport = rawEvent.sport?.slug?.toLowerCase();
    if (sport == 'soccer') return 'football';
    if (sport == 'basketball') return 'basketball';
    if (sport == 'tennis') return 'tennis';
    if (sport == 'volleyball') return 'volleyball';

    final league = rawEvent.league;
    final leagueName = (league?.name ?? '').toLowerCase();

    // Check league name for sports
    if (leagueName.contains('nba') || leagueName.contains('basketball')) {
      return 'basketball';
    }
    if (leagueName.contains('atp') ||
        leagueName.contains('wta') ||
        leagueName.contains('tennis') ||
        leagueName.contains('us open') ||
        leagueName.contains('wimbledon') ||
        leagueName.contains('french open') ||
        leagueName.contains('australian open')) {
      return 'tennis';
    }
    if (leagueName.contains('premier') ||
        leagueName.contains('la liga') ||
        leagueName.contains('bundesliga') ||
        leagueName.contains('serie a') ||
        leagueName.contains('ligue') ||
        leagueName.contains('soccer') ||
        leagueName.contains('football')) {
      return 'football';
    }

    if (leagueName.contains('volleyball') || leagueName.contains('fivb')) {
      return 'volleyball';
    }

    if (sport != null && sport.isNotEmpty && sport != 'unknown') {
      if (sport.contains('soccer') || sport.contains('football')) {
        return 'football';
      }
      if (sport.contains('basketball')) return 'basketball';
      if (sport.contains('tennis')) return 'tennis';
      if (sport.contains('volleyball')) return 'volleyball';
      return sport;
    }

    return 'football';
  }

  String _canonicalSportId(String sportId) {
    final normalized = sportId.toLowerCase();
    return normalized == 'soccer' ? 'football' : normalized;
  }
}

class _EspnEndpointPath {
  const _EspnEndpointPath({required this.sportPath, required this.leaguePath});

  final String sportPath;
  final String leaguePath;
}

class _EspnEventMeta {
  const _EspnEventMeta({
    required this.eventId,
    required this.sportPath,
    required this.leaguePath,
  });

  final String eventId;
  final String sportPath;
  final String leaguePath;
}
