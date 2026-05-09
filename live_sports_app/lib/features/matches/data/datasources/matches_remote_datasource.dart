import 'dart:math';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/entities/match.dart';
import '../../domain/repositories/matches_repository.dart';
import '../models/espn/espn_models.dart';
import '../models/match_event_commentary.dart';
import '../models/match_model.dart';
import '../models/team_model.dart';

abstract class MatchesRemoteDataSource {
  Future<List<MatchModel>> getLiveMatches({String? sportId});
  Future<List<MatchModel>> getLiveMatchesByLeague(String leagueId, {String? sportId});
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
  Future<List<CommentaryModel>> getMatchCommentary(String matchId, {int? since});
}

class MatchesRemoteDataSourceImpl implements MatchesRemoteDataSource {
  const MatchesRemoteDataSourceImpl({required DioClient dioClient})
      : _dio = dioClient;

  final DioClient _dio;
  static const Duration _resultsCacheTtl = Duration(seconds: 45);
  static final Map<String, _ResultsCacheEntry> _resultsCache =
    <String, _ResultsCacheEntry>{};
  static final Map<String, Future<List<MatchModel>>> _resultsInFlight =
    <String, Future<List<MatchModel>>>{};
  static final Map<String, _EspnEventMeta> _espnMetaCache =
    <String, _EspnEventMeta>{};
  static final Map<String, Future<List<CommentaryModel>>> _espnCommentaryInFlight =
    <String, Future<List<CommentaryModel>>>{};

  @override
  Future<List<MatchModel>> getLiveMatches({String? sportId}) async {
    final all = await _collectEspnMatches(
      fromOffsetDays: -1,
      toOffsetDays: 1,
      sportId: sportId,
    );
    return all.where((match) => match.status == MatchStatus.live).toList(growable: false);
  }

  @override
  Future<List<MatchModel>> getLiveMatchesByLeague(String leagueId, {String? sportId}) async {
    final live = await getLiveMatches(sportId: sportId);
    return live.where((match) => match.leagueId == leagueId).toList(growable: false);
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
    final target = DateTime.utc(date.toUtc().year, date.toUtc().month, date.toUtc().day);
    final all = await _collectEspnMatches(
      fromOffsetDays: 0,
      toOffsetDays: 0,
      baseDate: target,
    );
    return all.where((match) => _isSameUtcDay(match.scheduledAt, target)).toList(growable: false);
  }

  @override
  Future<MatchModel> getMatchById(String matchId) async {
    if (_isEspnMatchId(matchId)) {
      final all = await _collectEspnMatches(
        fromOffsetDays: -2,
        toOffsetDays: 10,
      );
      final found = all.where((match) => match.id == matchId).toList(growable: false);
      if (found.isNotEmpty) return found.first;
      throw StateError('Match not found: $matchId');
    }

    throw StateError('Non-ESPN matches are not supported. Use ESPN match IDs (espn_*)');
  }

  @override
  Future<List<MatchEventModel>> getMatchEvents(String matchId) async {
    // ESPN matches don't expose timeline events, only commentary
    return const <MatchEventModel>[];
  }

  @override
  Future<List<CommentaryModel>> getMatchCommentary(String matchId, {int? since}) async {
    final espn = await _getEspnCommentary(matchId, since: since);
    if (espn.isNotEmpty) return espn;
    
    final match = await getMatchById(matchId);
    return _buildFallbackCommentary(match, since: since);
  }

  List<CommentaryModel> _buildFallbackCommentary(MatchModel match, {int? since}) {
    final minute = match.elapsed ?? 0;
    final statusText = switch (match.status) {
      MatchStatus.live => 'Live update',
      MatchStatus.paused => 'Match paused',
      MatchStatus.finished => 'Full time',
      MatchStatus.scheduled || MatchStatus.prematch => 'Scheduled',
      MatchStatus.postponed => 'Postponed',
      MatchStatus.cancelled => 'Cancelled',
      MatchStatus.unknown => 'Status update',
    };

    final score =
        '${match.homeTeam.name} ${match.homeScore ?? 0} - ${match.awayScore ?? 0} ${match.awayTeam.name}';
    final timeNote = match.isScheduled
        ? 'Kickoff at ${match.scheduledAt.toLocal().toIso8601String().substring(0, 16).replaceFirst('T', ' ')}'
        : "At $minute'";

    final item = CommentaryModel(
      id: 'fallback_${match.id}_${match.elapsed ?? 0}_${match.homeScore ?? 0}_${match.awayScore ?? 0}',
      matchId: match.id,
      minute: minute,
      text: '$statusText. $score. $timeNote.',
      isKeyEvent: true,
      publishedAt: DateTime.now().toUtc(),
    );

    if (since != null && item.minute <= since) {
      return const <CommentaryModel>[];
    }
    return <CommentaryModel>[item];
  }

  Future<List<CommentaryModel>> _getEspnCommentary(
    String matchId, {
    int? since,
  }) async {
    final key = '$matchId:${since ?? 'all'}';
    final inFlight = _espnCommentaryInFlight[key];
    if (inFlight != null) return inFlight;

    final future = _fetchEspnSummaryCommentary(matchId, since: since);
    _espnCommentaryInFlight[key] = future;
    try {
      return await future;
    } finally {
      _espnCommentaryInFlight.remove(key);
    }
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

      final response = await _dio.instance.get<Map<String, dynamic>>(uri.toString());
      if (response.data == null) return const <CommentaryModel>[];
      
      final summaryResponse = EspnSummaryResponse.fromJson(response.data!);
      final items = _extractEspnCommentaryItems(summaryResponse);
      if (items.isEmpty) return const <CommentaryModel>[];

      final commentary = <CommentaryModel>[];
      for (var index = 0; index < items.length; index++) {
        final mapped = _mapEspnCommentaryItem(items[index], matchId: matchId, index: index);
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
    final cached = _espnMetaCache[matchId];
    if (cached != null) return cached;

    final rawId = matchId.replaceFirst('espn_', '').trim();
    if (rawId.isEmpty) return null;

    final endpoints = _resolveEspnEndpoints(null);
    final seedDate = DateTime.now().toUtc();

    for (var offset = -2; offset <= 10; offset++) {
      final day = seedDate.add(Duration(days: offset));
      final dateQuery = _formatEspnDate(day);

      final eventsByEndpoint = await Future.wait(
        endpoints
            .map((endpoint) =>
                _fetchEspnEventsForDate(endpoint: endpoint, dateQuery: dateQuery))
            .toList(growable: false),
      );

      for (var index = 0; index < endpoints.length; index++) {
        final endpoint = endpoints[index];
        final events = eventsByEndpoint[index];
        for (final rawEvent in events) {
          final eventId = rawEvent.id;
          if (eventId != rawId) continue;
          final path = _parseEspnEndpointPath(endpoint) ?? _pathFromEspnEvent(rawEvent);
          if (path == null) return null;
          final meta = _EspnEventMeta(
            eventId: eventId,
            sportPath: path.sportPath,
            leaguePath: path.leaguePath,
          );
          _espnMetaCache[matchId] = meta;
          return meta;
        }
      }
    }

    return null;
  }

  List<EspnCommentaryItem> _extractEspnCommentaryItems(EspnSummaryResponse data) {
    final items = <EspnCommentaryItem>[];
    
    // Try to get from article first
    final article = data.article;
    if (article != null) {
      if (article.commentary.isNotEmpty) {
        items.addAll(article.commentary);
      }
      if (article.items.isNotEmpty) {
        items.addAll(article.items);
      }
    }
    
    // Try to get directly from root
    if (data.commentary.isNotEmpty) {
      items.addAll(data.commentary);
    }
    
    return items;
  }

  CommentaryModel _mapEspnCommentaryItem(
    EspnCommentaryItem raw, {
    required String matchId,
    required int index,
  }) {
    final id = raw.id ?? raw.playId ?? raw.sequence?.toString() ?? index.toString();
    final text = raw.text ??
        raw.shortText ??
        raw.headline ??
        raw.description ??
        '';
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
    final key = _resultsCacheKey(sportId);
    final now = DateTime.now().toUtc();
    final cached = _resultsCache[key];
    if (cached != null && now.difference(cached.fetchedAt) <= _resultsCacheTtl) {
      return cached.items;
    }

    final inFlight = _resultsInFlight[key];
    if (inFlight != null) {
      return inFlight;
    }

    final future = _collectEspnMatches(
      fromOffsetDays: -10,
      toOffsetDays: 10,
      sportId: sportId,
    );
    _resultsInFlight[key] = future;

    try {
      final items = await future;
      _resultsCache[key] = _ResultsCacheEntry(
        items: items,
        fetchedAt: DateTime.now().toUtc(),
      );
      return items;
    } finally {
      _resultsInFlight.remove(key);
    }
  }

  Future<List<EspnEvent>> _fetchEspnEventsForDate({
    required String endpoint,
    required String dateQuery,
  }) async {
    try {
      final response = await _dio.instance.get<Map<String, dynamic>>(
        endpoint,
        queryParameters: {'dates': dateQuery},
      );
      if (response.data == null) return const [];
      final scoreboard = EspnScoreboardResponse.fromJson(response.data!);
      return scoreboard.events;
    } catch (_) {
      return const [];
    }
  }

  Future<List<MatchModel>> _collectEspnMatches({
    required int fromOffsetDays,
    required int toOffsetDays,
    String? sportId,
    DateTime? baseDate,
  }) async {
    final endpoints = _resolveEspnEndpoints(sportId);
    final seedDate = (baseDate ?? DateTime.now().toUtc()).toUtc();
    final seen = <String>{};
    final all = <MatchModel>[];
    // If we're requesting a specific sport, trust that the endpoint will return that sport
    final expectedSport = sportId != null ? _canonicalSportId(sportId) : null;

    for (var offset = fromOffsetDays; offset <= toOffsetDays; offset++) {
      final day = seedDate.add(Duration(days: offset));
      final dateQuery = _formatEspnDate(day);

      final eventsByEndpoint = await Future.wait(
        endpoints
            .map((endpoint) =>
                _fetchEspnEventsForDate(endpoint: endpoint, dateQuery: dateQuery))
            .toList(growable: false),
      );

      for (var index = 0; index < endpoints.length; index++) {
        final endpoint = endpoints[index];
        final events = eventsByEndpoint[index];
        final endpointPath = _parseEspnEndpointPath(endpoint);
        for (final rawEvent in events) {
          final normalizedSport = expectedSport ?? _sportIdFromEspnEvent(rawEvent);
          if (sportId != null &&
              sportId.isNotEmpty &&
              normalizedSport != _canonicalSportId(sportId)) {
            continue;
          }

          final mapped = _mapEspnEventToMatch(rawEvent, sportId: normalizedSport);
          if (mapped.id.isEmpty || seen.contains(mapped.id)) continue;
          _cacheEspnMeta(mapped.id, rawEvent: rawEvent, endpointPath: endpointPath);
          seen.add(mapped.id);
          all.add(mapped);
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



  List<MatchModel> _applyFilters(
    List<MatchModel> items,
    MatchFilters filters, {
    bool applySportFilter = true,
  }) {
    return items.where((match) {
      final withinFrom =
          filters.from == null || !match.scheduledAt.isBefore(filters.from!);
      final withinTo = filters.to == null || !match.scheduledAt.isAfter(filters.to!);
      final leagueMatch =
          filters.leagueId == null || match.leagueId == filters.leagueId;
      final teamMatch = filters.teamId == null ||
          match.homeTeam.id == filters.teamId ||
          match.awayTeam.id == filters.teamId;
      final sportMatch = !applySportFilter ||
          filters.sportId == null ||
          match.sportId == _canonicalSportId(filters.sportId!);
      final roundMatch = filters.round == null || match.round == filters.round;
      return withinFrom && withinTo && leagueMatch && teamMatch && sportMatch && roundMatch;
    }).toList(growable: false);
  }

  List<MatchModel> _paginate(List<MatchModel> items, PaginationParams pagination) {
    final start = max(0, (pagination.page - 1) * pagination.perPage);
    if (start >= items.length) return const [];
    final end = min(items.length, start + pagination.perPage);
    return items.sublist(start, end);
  }

  void _cacheEspnMeta(
    String matchId, {
    required EspnEvent rawEvent,
    required _EspnEndpointPath? endpointPath,
  }) {
    if (_espnMetaCache.containsKey(matchId)) return;
    final eventId = rawEvent.id;
    if (eventId.isEmpty) return;

    final path = endpointPath ?? _pathFromEspnEvent(rawEvent);
    if (path == null) return;

    _espnMetaCache[matchId] = _EspnEventMeta(
      eventId: eventId,
      sportPath: path.sportPath,
      leaguePath: path.leaguePath,
    );
  }

  _EspnEndpointPath? _parseEspnEndpointPath(String endpoint) {
    final match = RegExp(r'/sports/([^/]+)/([^/]+)/scoreboard')
        .firstMatch(endpoint);
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
      final match = RegExp(r'/sports/([^/]+)/([^/]+)/').firstMatch(href);
      if (match != null) {
        return _EspnEndpointPath(
          sportPath: match.group(1)!,
          leaguePath: match.group(2)!,
        );
      }
    }

    final sportSlug = rawEvent.sport?.slug;
    final leagueSlug = rawEvent.league?.slug;
    if (sportSlug != null && sportSlug.isNotEmpty &&
        leagueSlug != null && leagueSlug.isNotEmpty) {
      return _EspnEndpointPath(
        sportPath: sportSlug,
        leaguePath: leagueSlug,
      );
    }

    return null;
  }

  String _resultsCacheKey(String? sportId) {
    final normalized = (sportId == null || sportId.isEmpty)
        ? 'all'
        : _canonicalSportId(sportId);
    return 'results_$normalized';
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
    return left.year == right.year && left.month == right.month && left.day == right.day;
  }

  static int? _parseEspnElapsed(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    final segments = raw.split(':');
    if (segments.isNotEmpty) {
      final minute = int.tryParse(segments.first);
      if (minute != null) return minute;
    }

    final regexpMatch = RegExp(r'(\d+)').firstMatch(raw);
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
    for (final competitor in competitors) {
      final homeAway = (competitor.homeAway ?? '').toLowerCase();
      if (homeAway == 'home') home = competitor;
      if (homeAway == 'away') away = competitor;
    }
    home ??= competitors.isNotEmpty ? competitors.first : null;
    away ??= competitors.length > 1 ? competitors[1] : null;

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

    final homeTeam = _espnCompetitorToTeam(home);
    final awayTeam = _espnCompetitorToTeam(away);

    return MatchModel(
      id: 'espn_${rawEvent.id}',
      leagueId: leagueId,
      sportId: sportId,
      homeTeam: homeTeam,
      awayTeam: awayTeam,
      scheduledAt: scheduledAt,
      status: matchStatus,
      homeScore: home?.score,
      awayScore: away?.score,
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
      id: team.id,
      name: team.displayName ?? team.name ?? 'Unknown',
      shortName: team.shortDisplayName ?? team.abbreviation,
      logoUrl: logos.isNotEmpty ? logos.first.href : null,
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
    if (leagueName.contains('atp') || leagueName.contains('wta') || 
        leagueName.contains('tennis') || leagueName.contains('us open') ||
        leagueName.contains('wimbledon') || leagueName.contains('french open') ||
        leagueName.contains('australian open')) {
      return 'tennis';
    }
    if (leagueName.contains('premier') || leagueName.contains('la liga') || 
        leagueName.contains('bundesliga') || leagueName.contains('serie a') ||
        leagueName.contains('ligue') || leagueName.contains('soccer') ||
        leagueName.contains('football')) {
      return 'football';
    }

    if (leagueName.contains('volleyball') || leagueName.contains('fivb')) {
      return 'volleyball';
    }

    if (sport != null && sport.isNotEmpty && sport != 'unknown') {
      if (sport.contains('soccer') || sport.contains('football')) return 'football';
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

class _ResultsCacheEntry {
  const _ResultsCacheEntry({required this.items, required this.fetchedAt});

  final List<MatchModel> items;
  final DateTime fetchedAt;
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
