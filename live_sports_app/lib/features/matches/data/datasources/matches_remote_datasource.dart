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
      {int? since, String? sportId});
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
      final leagueSlug = endpointPath != null
          ? '${endpointPath.sportPath}/${endpointPath.leaguePath}'
          : null;
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

          final mapped = _mapEspnEventToMatch(rawEvent,
              sportId: normalizedSport, leagueSlug: leagueSlug);
          if (mapped.id.isEmpty || seen.contains(mapped.id)) continue;
          seen.add(mapped.id);
          all.add(mapped);
          _matchCache[mapped.id] = mapped;
        } catch (_) {
          continue;
        }
      }
    }

    return all;
  }

  @override
  Future<List<MatchModel>> getLiveMatchesByLeague(String leagueId,
      {String? sportId}) async {
    // When leagueId is an ESPN slug (e.g. "soccer/eng.1"), build the URL directly.
    // Otherwise fall back to the name-based lookup.
    final endpoints = leagueId.contains('/')
        ? ['https://site.api.espn.com/apis/site/v2/sports/$leagueId/scoreboard']
        : (leagueId.isNotEmpty
            ? _resolveEspnEndpointsForLeague(leagueId, sportId)
            : _resolveEspnEndpoints(sportId));

    // Always fetch fresh — the endpoint already returns exactly the right league.
    final current = await _fetchCurrentScoreboards(endpoints, sportId: sportId);
    if (current.isNotEmpty) return current;

    // Fallback: fetch upcoming fixtures if nothing is live right now.
    final upcoming = await _collectEspnMatches(
      fromOffsetDays: 0,
      toOffsetDays: 7,
      sportId: sportId,
      baseDate: DateTime.now().toUtc(),
      endpoints: endpoints,
    );
    return upcoming;
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
    final all = await _getResultsWindow(
      sportId: filters.sportId,
      baseDate: filters.from,
      endpoints: _leagueEndpoints(filters.leagueId),
    );

    final filtered = _applyFilters(all, filters)
        .where((match) => match.status == MatchStatus.finished)
        .toList(growable: false);

    filtered.sort((a, b) => b.scheduledAt.compareTo(a.scheduledAt));
    return _paginate(filtered, pagination);
  }

  @override
  Future<List<MatchModel>> getScheduledMatches({
    required PaginationParams pagination,
    MatchFilters filters = const MatchFilters(),
  }) async {
    final all = await _getResultsWindow(
      sportId: filters.sportId,
      baseDate: filters.from,
      endpoints: _leagueEndpoints(filters.leagueId),
    );

    final filtered = _applyFilters(all, filters)
        .where((match) => match.status == MatchStatus.scheduled)
        .toList(growable: false);

    filtered.sort((a, b) => a.scheduledAt.compareTo(b.scheduledAt));
    return _paginate(filtered, pagination);
  }

  /// Returns a single-item endpoint list when [leagueId] is an ESPN slug
  /// (e.g. "soccer/esp.1"), otherwise null (use the default sport endpoints).
  List<String>? _leagueEndpoints(String? leagueId) {
    if (leagueId == null || !leagueId.contains('/')) return null;
    return ['https://site.api.espn.com/apis/site/v2/sports/$leagueId/scoreboard'];
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
      // Current scoreboards (no date filter) — fastest path for live matches.
      await _fetchCurrentScoreboards(_resolveEspnEndpoints(null));
      final fromCurrent = _matchCache[matchId];
      if (fromCurrent != null) return fromCurrent;

      // Narrow date window for recently finished/upcoming matches.
      await _collectEspnMatches(fromOffsetDays: -1, toOffsetDays: 1);
      final fromNarrow = _matchCache[matchId];
      if (fromNarrow != null) return fromNarrow;

      // Wide fallback for older or future matches.
      await _collectEspnMatches(fromOffsetDays: -7, toOffsetDays: 7);
      final fromWide = _matchCache[matchId];
      if (fromWide != null) return fromWide;

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
      {int? since, String? sportId}) async {
    final espn = await _fetchEspnSummaryCommentary(
      matchId,
      since: since,
      sportId: sportId,
    );
    return espn;
  }

  Future<List<CommentaryModel>> _fetchEspnSummaryCommentary(
    String matchId, {
    int? since,
    String? sportId,
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

      final normalizedSport = _canonicalSportId(sportId ?? _sportIdFromEspnMeta(meta));

      final commentary = <CommentaryModel>[];
      for (var index = 0; index < items.length; index++) {
        final mapped = _mapEspnCommentaryItem(items[index],
            matchId: matchId,
            index: index,
            sportId: normalizedSport);
        if (since == null || mapped.minute > since) {
          commentary.add(mapped);
        }
      }

      commentary.sort((a, b) {
        final publishedAtCompare = (b.publishedAt ?? DateTime.fromMillisecondsSinceEpoch(0))
            .compareTo(a.publishedAt ?? DateTime.fromMillisecondsSinceEpoch(0));
        if (publishedAtCompare != 0) return publishedAtCompare;
        final minuteCompare = b.minute.compareTo(a.minute);
        if (minuteCompare != 0) return minuteCompare;
        return b.id.compareTo(a.id);
      });
      return commentary;
    } catch (_) {
      return const <CommentaryModel>[];
    }
  }

  Future<_EspnEventMeta?> _getEspnMeta(String matchId) async {
    final rawId = matchId.replaceFirst('espn_', '').trim();
    if (rawId.isEmpty) return null;

    // 1. Check side-effect cache (populated during any scoreboard fetch) — O(1).
    final cached = _metaIndexCache;
    if (cached != null && cached.containsKey(rawId)) return cached[rawId];

    // 2. Derive from the match's stamped leagueId (e.g. "soccer/esp.1") — no HTTP.
    final cachedMatch = _matchCache[matchId];
    final leagueId = cachedMatch?.leagueId ?? '';
    if (leagueId.contains('/')) {
      final sep = leagueId.indexOf('/');
      final meta = _EspnEventMeta(
        eventId: rawId,
        sportPath: leagueId.substring(0, sep),
        leaguePath: leagueId.substring(sep + 1),
      );
      _metaIndexCache ??= {};
      _metaIndexCache![rawId] = meta;
      _metaIndexCachedAt ??= DateTime.now().toUtc();
      return meta;
    }

    // 3. Current scoreboards (no date filter) — fastest path for live matches.
    await _fetchCurrentScoreboards(_resolveEspnEndpoints(null));
    final fromCurrent = _metaIndexCache?[rawId];
    if (fromCurrent != null) return fromCurrent;

    // 4. Narrow date scan for recently finished/upcoming matches.
    await _collectEspnMatches(fromOffsetDays: -1, toOffsetDays: 1);
    final fromNarrow = _metaIndexCache?[rawId];
    if (fromNarrow != null) return fromNarrow;

    // 5. Wide scan — last resort.
    await _collectEspnMatches(fromOffsetDays: -7, toOffsetDays: 7);
    return _metaIndexCache?[rawId];
  }

  List<EspnCommentaryItem> _extractEspnCommentaryItems(
      EspnSummaryResponse data, Map<String, dynamic> raw) {
    final items = <EspnCommentaryItem>[];

    // Items already parsed by freezed (flat-string format).
    final article = data.article;
    if (article != null) {
      if (article.commentary.isNotEmpty) items.addAll(article.commentary);
      if (article.items.isNotEmpty) items.addAll(article.items);
    }
    if (data.commentary.isNotEmpty) items.addAll(data.commentary);

    // ESPN soccer summary wraps everything under "gamepackageJSON".
    // Other sports put data at root level — check both.
    final gpj = raw['gamepackageJSON'];
    final rawToSearch = (gpj is Map<String, dynamic>) ? gpj : raw;

    // commentary array (ESPN soccer: each item has nested text/type objects)
    final commentaryList = rawToSearch['commentary'];
    if (commentaryList is List) {
      for (final entry in commentaryList) {
        if (entry is! Map) continue;
        final item = _parseLooseCommentaryItem(entry.cast<String, dynamic>());
        if (item != null) items.add(item);
      }
    }

    // plays / keyPlays / playByPlay
    for (final key in const ['plays', 'keyPlays', 'playByPlay']) {
      final plays = rawToSearch[key];
      if (plays is! List) continue;
      for (final play in plays) {
        if (play is! Map) continue;
        final item = _parseLooseCommentaryItem(play.cast<String, dynamic>());
        if (item != null) items.add(item);
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

  /// Parses one commentary/play entry that may have ESPN's nested object format:
  ///   text:  {"type": "h2", "value": "45': Goal!"} or a plain string
  ///   type:  {"id": "2", "text": "Goal"}           or a plain string
  EspnCommentaryItem? _parseLooseCommentaryItem(Map<String, dynamic> p) {
    // Try the generated deserializer first (works for flat-string format).
    try {
      final item = EspnCommentaryItem.fromJson(p);
      if ((item.text ?? '').isNotEmpty || (item.shortText ?? '').isNotEmpty) {
        return item;
      }
    } catch (_) {}

    // Extract text, handling both {"type":"h2","value":"..."} and plain strings.
    String text = _extractStringField(p['text']) ??
        _extractStringField(p['shortText']) ??
        _extractStringField(p['headline']) ??
        _extractStringField(p['description']) ??
        '';
    if (text.isEmpty) return null;

    // Extract type label from nested or flat value.
    final typeStr = _extractStringField(p['type'], preferKeys: const ['text', 'name']) ??
        _extractStringField(p['typeText']) ??
        '';

    // Extract minute from time object or direct field.
    int? minute;
    final rawTime = p['time'];
    if (rawTime is Map) {
      final display = rawTime['displayValue']?.toString() ?? '';
      final clock = rawTime['value']?.toString() ?? '';
      final src = display.isNotEmpty ? display : clock;
      final m = _digitsPattern.firstMatch(src);
      if (m != null) minute = int.tryParse(m.group(1)!);
    } else if (p['minute'] is num) {
      minute = (p['minute'] as num).toInt();
    }

    final scoringPlay = p['scoringPlay'] == true;
    final rawId = p['id'] ?? p['playId'] ?? p['sequence']?.toString() ?? '';
    final timeDate = (rawTime is Map) ? rawTime['date']?.toString() : null;

    return EspnCommentaryItem(
      id: rawId?.toString(),
      text: text,
      minute: minute,
      scoringPlay: scoringPlay,
      type: typeStr.isNotEmpty ? typeStr : null,
      timestamp: timeDate ?? p['timestamp']?.toString(),
    );
  }

  /// Extracts a non-empty string from a field that may be a plain string or a
  /// map like {"type":"h2","value":"..."} or {"text":"...","id":"2"}.
  String? _extractStringField(dynamic raw, {List<String> preferKeys = const ['value', 'text']}) {
    if (raw is String) return raw.trim().isEmpty ? null : raw.trim();
    if (raw is Map) {
      for (final key in preferKeys) {
        final v = raw[key];
        if (v is String && v.trim().isNotEmpty) return v.trim();
      }
    }
    return null;
  }

  CommentaryModel _mapEspnCommentaryItem(
    EspnCommentaryItem raw, {
    required String matchId,
    required int index,
    required String sportId,
  }) {
    final id =
        raw.id ?? raw.playId ?? raw.sequence?.toString() ?? index.toString();
    final text = _buildCommentaryText(raw, sportId);
    final minute = _commentaryMinute(raw, sportId) ?? 0;
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

  String _buildCommentaryText(EspnCommentaryItem raw, String sportId) {
    final direct = [raw.text, raw.shortText, raw.headline, raw.description]
        .whereType<String>()
        .map((value) => value.trim())
        .firstWhere((value) => value.isNotEmpty, orElse: () => '');
    if (direct.isNotEmpty) {
      return direct;
    }

    final type = (raw.typeText ?? raw.type ?? '').trim();
    final time = raw.time?.displayValue ?? raw.time?.clock ?? raw.time?.value;
    final score = raw.scoreValue?.trim();

    final sportLabel = switch (sportId) {
      'basketball' => 'Basketball update',
      'tennis' => 'Tennis update',
      'volleyball' => 'Volleyball update',
      _ => 'Live update',
    };

    final detailParts = <String>[];
    if (type.isNotEmpty) detailParts.add(type);
    if (score != null && score.isNotEmpty) detailParts.add(score);
    if (time != null && time.isNotEmpty) detailParts.add(time);

    if (detailParts.isNotEmpty) {
      return '$sportLabel: ${detailParts.join(' · ')}';
    }

    return sportLabel;
  }

  int? _commentaryMinute(EspnCommentaryItem raw, String sportId) {
    final minute = raw.minute;
    if (minute != null && minute > 0) return minute;

    final timeValue = raw.time?.value ?? raw.time?.clock ?? raw.time?.displayValue;
    final parsed = _digitsPattern.firstMatch(timeValue ?? '');
    if (parsed != null) {
      return int.tryParse(parsed.group(1)!);
    }

    if (sportId == 'football') {
      final timeText = raw.timestamp ?? raw.date ?? raw.created ?? raw.time?.date;
      final minuteText = _digitsPattern.firstMatch(timeText ?? '');
      if (minuteText != null) {
        return int.tryParse(minuteText.group(1)!);
      }
    }

    return null;
  }

  Future<List<MatchModel>> _getResultsWindow({
    String? sportId,
    DateTime? baseDate,
    List<String>? endpoints,
  }) async {
    final base = (baseDate ?? DateTime.now()).toUtc();
    final resolvedEndpoints = endpoints ?? _resolveEspnEndpoints(sportId);
    final dated = await _collectEspnMatches(
      fromOffsetDays: -7,
      toOffsetDays: 7,
      sportId: sportId,
      baseDate: base,
      endpoints: resolvedEndpoints,
    );
    if (dated.isNotEmpty) return dated;

    // Fallback for endpoints that ignore the ?dates= param (e.g. tennis).
    return _fetchCurrentScoreboards(resolvedEndpoints, sportId: sportId);
  }

  Future<EspnScoreboardResponse> _fetchEspnScoreboardForDate({
    required String endpoint,
    String? dateQuery,
  }) async {
    try {
      final uri = dateQuery != null
          ? Uri.parse(endpoint).replace(queryParameters: {'dates': dateQuery})
          : Uri.parse(endpoint);
      final response = await _dio.instance.get<Map<String, dynamic>>(
        uri.toString(),
      );
      if (response.data == null) return const EspnScoreboardResponse();
      return EspnScoreboardResponse.fromJson(response.data!);
    } catch (_) {
      return const EspnScoreboardResponse();
    }
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
        final leagueSlug = endpointPath != null
            ? '${endpointPath.sportPath}/${endpointPath.leaguePath}'
            : null;
        for (final rawEvent in events) {
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

            final normalizedSport =
                expectedSport ?? _sportIdFromEspnEvent(rawEvent);
            if (sportId != null &&
                sportId.isNotEmpty &&
                normalizedSport != _canonicalSportId(sportId)) {
              continue;
            }

            final mapped = _mapEspnEventToMatch(rawEvent,
                sportId: normalizedSport, leagueSlug: leagueSlug);
            if (mapped.id.isEmpty || seen.contains(mapped.id)) continue;
            seen.add(mapped.id);
            all.add(mapped);
            _matchCache[mapped.id] = mapped;
          } catch (_) {
            continue;
          }
        }
      }
    }

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

  /// Resolves endpoints optimized for a specific league.
  /// If the league has a known ESPN endpoint, returns only that.
  /// Otherwise, falls back to all endpoints for the sport.
  List<String> _resolveEspnEndpointsForLeague(String leagueId, String? sportId) {
    if (leagueId.isEmpty) {
      return _resolveEspnEndpoints(sportId);
    }

    // Try to find the league in the league-to-endpoint mapping (exact match)
    final slug = ApiConstants.leagueNameToEspnEndpointSlug[leagueId];
    if (slug != null) {
      final url = 'https://site.api.espn.com/apis/site/v2/sports/$slug/scoreboard';
      return [url];
    }

    // Try case-insensitive match
    final lowerLeague = leagueId.toLowerCase();
    for (final entry in ApiConstants.leagueNameToEspnEndpointSlug.entries) {
      if (entry.key.toLowerCase().contains(lowerLeague) ||
          lowerLeague.contains(entry.key.toLowerCase())) {
        final url =
            'https://site.api.espn.com/apis/site/v2/sports/${entry.value}/scoreboard';
        return [url];
      }
    }

    // Fall back to all endpoints for the sport if league not found
    return _resolveEspnEndpoints(sportId);
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
    String? leagueSlug,
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
    final eventLeagueId = (league?.name ??
            league?.slug ??
            competition?.type?.name ??
            competition?.type?.abbreviation ??
            league?.id ??
            competition?.id ??
            '')
        .toString();
    // ESPN scoreboard JSON puts league info at response-root, not per-event.
    // Use the endpoint slug as fallback so league filtering works correctly.
    final leagueId = eventLeagueId.isNotEmpty ? eventLeagueId : (leagueSlug ?? '');

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

  String _sportIdFromEspnMeta(_EspnEventMeta meta) {
    final sportPath = meta.sportPath.toLowerCase();
    if (sportPath.contains('soccer')) return 'football';
    if (sportPath.contains('basketball')) return 'basketball';
    if (sportPath.contains('tennis')) return 'tennis';
    if (sportPath.contains('volleyball')) return 'volleyball';
    return sportPath;
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
