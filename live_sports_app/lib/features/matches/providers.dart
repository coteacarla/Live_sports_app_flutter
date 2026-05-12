import 'dart:async';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/constants/polling_config.dart';
import '../../core/error/failures.dart';
import '../../core/result.dart';
import '../../injection/providers.dart';
import 'data/datasources/matches_remote_datasource.dart';
import 'data/repositories/matches_repository_impl.dart';
import 'domain/repositories/matches_repository.dart';
import 'domain/usecases/get_live_matches.dart';
import 'domain/usecases/get_past_matches.dart';
import 'domain/usecases/get_scheduled_matches.dart';
import 'domain/usecases/get_match_commentary.dart';
import 'domain/entities/match.dart';
import 'domain/entities/commentary.dart';
import 'state.dart';

part 'providers.g.dart';

final matchesRemoteDataSourceProvider = Provider<MatchesRemoteDataSource>(
  (ref) => MatchesRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)),
);

final matchesRepositoryProvider = Provider<MatchesRepository>(
  (ref) => MatchesRepositoryImpl(
    remoteDataSource: ref.watch(matchesRemoteDataSourceProvider),
    networkInfo: ref.watch(networkInfoProvider),
  ),
);

final getLiveMatchesUseCaseProvider = Provider<GetLiveMatches>(
  (ref) => GetLiveMatches(ref.watch(matchesRepositoryProvider)),
);

final getPastMatchesUseCaseProvider = Provider<GetPastMatches>(
  (ref) => GetPastMatches(ref.watch(matchesRepositoryProvider)),
);

final getScheduledMatchesUseCaseProvider = Provider<GetScheduledMatches>(
  (ref) => GetScheduledMatches(ref.watch(matchesRepositoryProvider)),
);

final getMatchCommentaryUseCaseProvider = Provider<GetMatchCommentary>(
  (ref) => GetMatchCommentary(ref.watch(matchesRepositoryProvider)),
);


@riverpod
class MatchCommentary extends _$MatchCommentary {
  late final String _matchId;
  String? _sportId;

  @override
  Future<List<Commentary>> build(String matchId) async {
    _matchId = matchId;
    _sportId = await _resolveSportId(matchId);
    return _loadInitialCommentary();
  }

  Future<void> poll() async {
    if (!ref.mounted) return;
    final current = state.value ?? const <Commentary>[];
    final since = _pollSince(current);
    final fresh = await _fetchCommentary(since: since);
    if (!ref.mounted) return;
    if (fresh.isNotEmpty) {
      _applyUpdates(current, fresh);
      return;
    }

    final fallback = await _fetchFallbackCommentary();
    if (!ref.mounted) return;
    if (fallback.isNotEmpty) {
      _applyUpdates(current, fallback);
    }
  }

  Future<List<Commentary>> _loadInitialCommentary() async {
    final commentary = await _fetchCommentary();
    if (!ref.mounted) return const [];
    if (commentary.isNotEmpty) return commentary;
    return _fetchFallbackCommentary();
  }

  Future<List<Commentary>> _fetchCommentary({int? since}) async {
    if (!ref.mounted) return const [];
    final useCase = ref.read(getMatchCommentaryUseCaseProvider);
    final result = await useCase(_matchId, since: since, sportId: _sportId);
    return result.fold(
      (items) => items,
      (_) => const <Commentary>[],
    );
  }

  Future<String?> _resolveSportId(String matchId) async {
    final repository = ref.read(matchesRepositoryProvider);
    final result = await repository.getMatchById(matchId);
    return result.fold(
      (match) => match.sportId,
      (_) => null,
    );
  }

  Future<List<Commentary>> _fetchFallbackCommentary() async {
    if (!ref.mounted) return const [];
    final repository = ref.read(matchesRepositoryProvider);
    final result = await repository.getMatchById(_matchId);
    return result.fold(
      (match) => <Commentary>[_buildFallbackCommentary(match)],
      (_) => const <Commentary>[],
    );
  }

  Commentary _buildFallbackCommentary(Match match) {
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

    return Commentary(
      id: 'fallback_${match.id}_${match.status.name}_${match.elapsed ?? 0}_${match.homeScore ?? 0}_${match.awayScore ?? 0}',
      matchId: match.id,
      minute: minute,
      text: '$statusText. $score. $timeNote.',
      isKeyEvent: true,
      publishedAt: DateTime.now().toUtc(),
    );
  }

  void _applyUpdates(List<Commentary> current, List<Commentary> incoming) {
    final knownIds = current.map((item) => item.id).toSet();
    final merged = <Commentary>[...current];
    for (final item in incoming) {
      if (knownIds.add(item.id)) {
        merged.add(item);
      }
    }
    if (merged.length != current.length) {
      state = AsyncData(merged);
    }
  }

  int? _pollSince(List<Commentary> items) {
    if (_sportId != null && _sportId != 'football') return null;

    final liveItems = items
        .where((item) => !item.id.startsWith('fallback_'))
        .toList(growable: false);
    if (liveItems.isEmpty) return null;

    var latest = liveItems.first.minute;
    for (final item in liveItems.skip(1)) {
      if (item.minute > latest) latest = item.minute;
    }
    return latest;
  }
}

@Riverpod(keepAlive: true)
class SelectedSportId extends _$SelectedSportId {
  @override
  String build() => 'football';

  void setSportId(String sportId) {
    final canonical = _canonicalSportId(sportId);
    if (canonical == state) return;
    // Reset league selection whenever the active sport actually changes.
    ref.read(selectedLeagueIdProvider.notifier).setLeagueId(null);
    state = canonical;
  }
}

@Riverpod(keepAlive: true)
class SelectedLeagueId extends _$SelectedLeagueId {
  @override
  String? build() => null;

  void setLeagueId(String? leagueId) => state = leagueId;
}

@Riverpod(keepAlive: true)
class SelectedDate extends _$SelectedDate {
  @override
  DateTime build() => DateTime.now();

  void setDate(DateTime date) => state = date;
  void goForward() => state = state.add(const Duration(days: 1));
  void goBack() => state = state.subtract(const Duration(days: 1));
}

@riverpod
class LiveMatches extends _$LiveMatches {
  Timer? _pollingTimer;
  bool _isFetching = false;
  int _buildVersion = 0;
  String _sportId = 'football';

  @override
  LiveMatchesState build() {
    _buildVersion++;
    final buildVersion = _buildVersion;
    _sportId = _canonicalSportId(ref.watch(selectedSportIdProvider));
    ref.watch(selectedLeagueIdProvider);

    _pollingTimer?.cancel();
    _isFetching = false;

    Future.microtask(() {
      ref.onDispose(() {
        _pollingTimer?.cancel();
      });

      _pollingTimer = Timer.periodic(PollingConfig.liveMatches, (_) {
        unawaited(_fetchMatches(silent: true, buildVersion: buildVersion));
      });

      unawaited(_fetchMatches(silent: false, buildVersion: buildVersion));
    });

    return const LiveMatchesState();
  }

  Future<void> refresh() => _fetchMatches(silent: false, buildVersion: _buildVersion);

  Future<void> _fetchMatches({
    required bool silent,
    required int buildVersion,
  }) async {
    if (_isFetching || buildVersion != _buildVersion) return;
    _isFetching = true;

    final sportId = _canonicalSportId(ref.read(selectedSportIdProvider));
    final leagueId = ref.read(selectedLeagueIdProvider);
    _sportId = sportId;

    if (!silent && state.matches.isEmpty) {
      state = state.copyWith(isLoading: true, errorMessage: null);
    }

    try {
      final result = await ref.read(getLiveMatchesUseCaseProvider)(
        leagueId: leagueId,
        sportId: sportId,
      );

      if (buildVersion != _buildVersion) return;

      result.fold(
        (matches) {
          final filtered = _filterMatches(matches);

          final previousScores = {
            for (final m in state.matches) m.id: (m.homeScore, m.awayScore),
          };
          final notifier = ref.read(matchNotificationPreferencesProvider.notifier);
          final notificationService = ref.read(localNotificationServiceProvider);
          for (final m in filtered) {
            if (!m.isLive || !notifier.isEnabled(m.id)) continue;
            final prev = previousScores[m.id];
            final isNew = prev == null;
            final scoreChanged = prev != null &&
                (prev.$1 != m.homeScore || prev.$2 != m.awayScore);
            if (!isNew && !scoreChanged) continue;
            final title = isNew
                ? 'Live now: ${m.homeTeam.name} vs ${m.awayTeam.name}'
                : 'Score update: ${m.homeTeam.name} vs ${m.awayTeam.name}';
            unawaited(
              notificationService.showInstantNotification(
                title: title,
                body:
                    '${m.homeTeam.name} ${m.homeScore ?? 0} - ${m.awayScore ?? 0} ${m.awayTeam.name}',
              ),
            );
          }

          state = state.copyWith(
            matches: filtered,
            isLoading: false,
            errorMessage: null,
            lastUpdated: DateTime.now().toUtc(),
          );
        },
        (failure) {
          if (state.matches.isEmpty) {
            state = state.copyWith(isLoading: false, errorMessage: failure.message);
          } else {
            state = state.copyWith(isLoading: false);
          }
        },
      );
    } finally {
      if (state.isLoading) state = state.copyWith(isLoading: false);
      _isFetching = false;
    }
  }

  List<Match> _filterMatches(List<Match> matches) {
    final leagueId = ref.read(selectedLeagueIdProvider);

    return matches
        .where((m) {
          if (m.sportId.toLowerCase() != _sportId.toLowerCase()) return false;
          if (leagueId != null && leagueId.isNotEmpty) {
            final ml = m.leagueId.toLowerCase();
            final fl = leagueId.toLowerCase();
            if (ml.isEmpty || (!ml.contains(fl) && !fl.contains(ml))) return false;
          }
          return m.isLive;
        })
        .toList(growable: false);
  }
}

@riverpod
class Results extends _$Results {
  bool _isFetching = false;
  int _buildVersion = 0;
  String _sportId = 'football';
  String? _leagueId;
  late DateTime _selectedDate;

  @override
  ResultsState build() {
    _buildVersion++;
    final buildVersion = _buildVersion;
    _sportId = _canonicalSportId(ref.watch(selectedSportIdProvider));
    _leagueId = ref.watch(selectedLeagueIdProvider);
    _selectedDate = ref.watch(selectedDateProvider);

    _isFetching = false;
    Future.microtask(() => unawaited(_fetchResults(silent: false, buildVersion: buildVersion)));
    return const ResultsState();
  }

  Future<void> refresh() => _fetchResults(silent: false, buildVersion: _buildVersion);

  Future<void> _fetchResults({
    required bool silent,
    required int buildVersion,
  }) async {
    if (_isFetching || buildVersion != _buildVersion) return;
    _isFetching = true;

    if (!silent && state.scheduledMatches.isEmpty && state.pastMatches.isEmpty) {
      state = state.copyWith(
        isLoading: true,
        scheduledErrorMessage: null,
        pastErrorMessage: null,
      );
    }

    // Compute start/end of the selected day in UTC for filtering.
    final dayUtc = DateTime.utc(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
    );
    final endOfDayUtc = dayUtc.add(const Duration(days: 1)).subtract(const Duration(milliseconds: 1));

    final getScheduledMatches = ref.read(getScheduledMatchesUseCaseProvider);
    final getPastMatches = ref.read(getPastMatchesUseCaseProvider);

    // Snapshot previous data so we can preserve it on network failure.
    final prevScheduled = state.scheduledMatches;
    final prevPast = state.pastMatches;

    try {
      final scheduledResult = await _loadSection(
        previousMatches: prevScheduled,
        fetch: (sportId, leagueId) => getScheduledMatches(
          pagination: const PaginationParams(page: 1, perPage: 30),
          filters: MatchFilters(
            sportId: sportId,
            leagueId: leagueId,
            from: dayUtc,
            to: endOfDayUtc,
          ),
        ),
      );

      final pastResult = await _loadSection(
        previousMatches: prevPast,
        fetch: (sportId, leagueId) => getPastMatches(
          pagination: const PaginationParams(page: 1, perPage: 30),
          filters: MatchFilters(
            sportId: sportId,
            leagueId: leagueId,
            from: dayUtc,
            to: endOfDayUtc,
          ),
        ),
      );

      if (buildVersion != _buildVersion) return;

      state = state.copyWith(
        scheduledMatches: scheduledResult.matches,
        pastMatches: pastResult.matches,
        scheduledErrorMessage: scheduledResult.errorMessage,
        pastErrorMessage: pastResult.errorMessage,
        isLoading: false,
        lastUpdated: DateTime.now().toUtc(),
      );
    } finally {
      if (state.isLoading) state = state.copyWith(isLoading: false);
      _isFetching = false;
    }
  }

  /// Fetches one section (scheduled or past). On network failure it preserves
  /// [previousMatches] so the screen never blanks out on a transient error.
  Future<({String? errorMessage, List<Match> matches})> _loadSection({
    required Future<Result<List<Match>, Failure>> Function(String, String?) fetch,
    required List<Match> previousMatches,
  }) async {
    final result = await fetch(_sportId, _leagueId);
    return result.fold(
      (matches) => (errorMessage: null, matches: matches),
      (failure) => (errorMessage: failure.message, matches: previousMatches),
    );
  }
}

@riverpod
class MatchDetail extends _$MatchDetail {
  late MatchDetailArgs _args;
  late Duration _livePollingInterval;
  late Duration _idlePollingInterval;
  bool _isDisposed = false;
  bool _isPolling = false;
  int _pollVersion = 0;

  @override
  MatchDetailState build(MatchDetailArgs args) {
    _args = args;
    _livePollingInterval = PollingConfig.matchDetailLive;
    _idlePollingInterval = PollingConfig.matchDetailIdle;

    state = MatchDetailState.fallback(args.matchId);
    if (args.initialMatch != null) {
      state = state.copyWith(match: args.initialMatch!);
    }
    state = state.copyWith(isLoading: false);

    _pollVersion++;
    final buildVersion = _pollVersion;
    _isPolling = false;

    ref.onDispose(() {
      _isDisposed = true;
    });

    Future.microtask(() => unawaited(_pollLoop(buildVersion)));
    return state;
  }

  Future<void> _pollLoop(int buildVersion) async {
    while (!_isDisposed && buildVersion == _pollVersion) {
      final wait = state.match.isLive ? _livePollingInterval : _idlePollingInterval;
      await Future<void>.delayed(wait);
      if (_isDisposed || buildVersion != _pollVersion) break;
      await refresh();
    }
  }

  Future<void> refresh() async {
    if (_isDisposed || _isPolling) return;
    _isPolling = true;

    await ref.read(matchCommentaryProvider(_args.matchId).notifier).poll();
    if (_isDisposed) {
      _isPolling = false;
      return;
    }

    state = state.copyWith(
      isLoading: false,
      lastUpdated: DateTime.now().toUtc(),
      errorMessage: null,
    );

    _isPolling = false;
  }
}

String _canonicalSportId(String value) {
  if (value.toLowerCase() == 'soccer') return 'football';
  return value.toLowerCase();
}
