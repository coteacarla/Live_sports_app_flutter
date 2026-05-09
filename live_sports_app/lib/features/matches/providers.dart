import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';

import '../../core/constants/polling_config.dart';
import '../../core/error/failures.dart';
import '../../core/notifications/local_notification_service.dart';
import '../../core/notifications/match_notification_preferences.dart';
import '../../injection/providers.dart';
import 'data/datasources/matches_remote_datasource.dart';
import 'data/repositories/matches_repository_impl.dart';
import 'domain/repositories/matches_repository.dart';
import 'domain/usecases/get_live_matches.dart';
import 'domain/usecases/get_past_matches.dart';
import 'domain/usecases/get_scheduled_matches.dart';
import 'domain/usecases/get_match_commentary.dart';
import 'domain/entities/match.dart';
import 'state.dart';

// ─────────────────────────────────────────────────────────────────────────
// DATA LAYER PROVIDERS
// ─────────────────────────────────────────────────────────────────────────

final matchesRemoteDataSourceProvider = Provider<MatchesRemoteDataSource>(
  (ref) => MatchesRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)),
);

final matchesRepositoryProvider = Provider<MatchesRepository>(
  (ref) => MatchesRepositoryImpl(
    remoteDataSource: ref.watch(matchesRemoteDataSourceProvider),
    networkInfo: ref.watch(networkInfoProvider),
  ),
);

// ─────────────────────────────────────────────────────────────────────────
// DOMAIN LAYER PROVIDERS (UseCases)
// ─────────────────────────────────────────────────────────────────────────

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

// ─────────────────────────────────────────────────────────────────────────
// FILTER PROVIDERS (Global state for sport/league selection)
// ─────────────────────────────────────────────────────────────────────────

final selectedSportIdProvider = StateProvider<String>((ref) => 'football');

final selectedLeagueIdProvider = StateProvider<String?>((ref) => null);

// ─────────────────────────────────────────────────────────────────────────
// LIVE MATCHES STATE NOTIFIER & PROVIDER
// ─────────────────────────────────────────────────────────────────────────

class _LiveMatchesNotifier extends StateNotifier<LiveMatchesState> {
  _LiveMatchesNotifier({
    required this.getLiveMatches,
    required this.notificationService,
    required this.notificationPreferences,
    String? initialSportId,
    String? initialLeagueId,
  })  : _sportId = _canonicalSportId(initialSportId ?? 'football'),
        _leagueId = initialLeagueId,
        super(const LiveMatchesState()) {
    _pollingTimer = Timer.periodic(PollingConfig.liveMatches, (_) {
      if (!_isDisposed) {
        _fetchMatches(silent: true);
      }
    });
    _fetchMatches(silent: false);
  }

  final GetLiveMatches getLiveMatches;
  final LocalNotificationService notificationService;
  final MatchNotificationPreferences notificationPreferences;

  late Timer _pollingTimer;
  bool _isFetching = false;
  bool _isDisposed = false;
  String _sportId;
  String? _leagueId;

  String get selectedSportId => _sportId;
  String? get selectedLeagueId => _leagueId;

  Future<void> refresh() => _fetchMatches(silent: false);

  void selectSport(String sportId) {
    final canonical = _canonicalSportId(sportId);
    if (canonical == _sportId) return;
    _sportId = canonical;
    state = state.copyWith(isLoading: true, errorMessage: null);
    _fetchMatches(silent: false);
  }

  void selectLeague(String? leagueId) {
    if (leagueId == _leagueId) return;
    _leagueId = leagueId;
    state = state.copyWith(isLoading: true, errorMessage: null);
    _fetchMatches(silent: false);
  }

  Future<void> _fetchMatches({required bool silent}) async {
    if (_isFetching || _isDisposed) return;
    _isFetching = true;

    if (!silent && state.matches.isEmpty) {
      state = state.copyWith(isLoading: true, errorMessage: null);
    }

    final result = await getLiveMatches(leagueId: _leagueId, sportId: _sportId);

    // Guard: don't update state if disposed
    if (_isDisposed) {
      _isFetching = false;
      return;
    }

    result.fold(
      (failure) {
        if (state.matches.isEmpty) {
          state = state.copyWith(isLoading: false, errorMessage: failure.message);
        } else {
          state = state.copyWith(isLoading: false);
        }
      },
      (matches) {
        final filtered = _filterMatches(matches);

        // Notify about newly started matches
        final previousIds = state.matches.map((m) => m.id).toSet();
        final newlyLive = filtered.where(
          (m) => m.isLive &&
              !previousIds.contains(m.id) &&
              notificationPreferences.isEnabled(m.id),
        );
        for (final m in newlyLive) {
          unawaited(
            notificationService.showInstantNotification(
              title: 'Live now: ${m.homeTeam.name} vs ${m.awayTeam.name}',
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
    );

    _isFetching = false;
  }

  List<Match> _filterMatches(List<Match> matches) {
    return matches
        .where((m) => m.sportId.toLowerCase() == _sportId.toLowerCase())
        .toList(growable: false);
  }

  @override
  void dispose() {
    _isDisposed = true;
    _pollingTimer.cancel();
    super.dispose();
  }
}

final liveMatchesProvider =
    StateNotifierProvider.autoDispose<_LiveMatchesNotifier, LiveMatchesState>((ref) {
  final getLiveMatches = ref.watch(getLiveMatchesUseCaseProvider);
  final notificationService = ref.watch(localNotificationServiceProvider);
  final notificationPreferences = ref.watch(matchNotificationPreferencesProvider);
  final sportId = ref.watch(selectedSportIdProvider);
  final leagueId = ref.watch(selectedLeagueIdProvider);

  final notifier = _LiveMatchesNotifier(
    getLiveMatches: getLiveMatches,
    notificationService: notificationService,
    notificationPreferences: notificationPreferences,
    initialSportId: sportId,
    initialLeagueId: leagueId,
  );

  // Sync sport selection
  ref.listen<String>(selectedSportIdProvider, (prev, next) {
    // Guard: only sync if actually changed and notifier isn't already at this state
    if (prev != null && prev != next && next != notifier.selectedSportId) {
      notifier.selectSport(next);
    }
  });

  // Sync league selection
  ref.listen<String?>(selectedLeagueIdProvider, (prev, next) {
    // Guard: only sync if actually changed and notifier isn't already at this state
    if (prev != next && next != notifier.selectedLeagueId) {
      notifier.selectLeague(next);
    }
  });

  return notifier;
});

// ─────────────────────────────────────────────────────────────────────────
// RESULTS STATE NOTIFIER & PROVIDER
// ─────────────────────────────────────────────────────────────────────────

class _ResultsNotifier extends StateNotifier<ResultsState> {
  _ResultsNotifier({
    required this.getPastMatches,
    required this.getScheduledMatches,
    String? initialSportId,
    String? initialLeagueId,
  })  : _sportId = _canonicalSportId(initialSportId ?? 'football'),
        _leagueId = initialLeagueId,
        super(const ResultsState()) {
    _fetchResults(silent: false);
  }

  final GetPastMatches getPastMatches;
  final GetScheduledMatches getScheduledMatches;

  bool _isFetching = false;
  bool _isDisposed = false;
  String _sportId;
  String? _leagueId;

  String get selectedSportId => _sportId;
  String? get selectedLeagueId => _leagueId;

  Future<void> refresh() => _fetchResults(silent: false);

  void selectSport(String sportId) {
    final canonical = _canonicalSportId(sportId);
    if (canonical == _sportId) return;
    _sportId = canonical;
    state = state.copyWith(
      isLoading: true,
      scheduledErrorMessage: null,
      pastErrorMessage: null,
    );
    _fetchResults(silent: false);
  }

  void selectLeague(String? leagueId) {
    if (leagueId == _leagueId) return;
    _leagueId = leagueId;
    state = state.copyWith(
      isLoading: true,
      scheduledErrorMessage: null,
      pastErrorMessage: null,
    );
    _fetchResults(silent: false);
  }

  Future<void> _fetchResults({required bool silent}) async {
    if (_isFetching || _isDisposed) return;
    _isFetching = true;

    if (!silent && state.scheduledMatches.isEmpty && state.pastMatches.isEmpty) {
      state = state.copyWith(
        isLoading: true,
        scheduledErrorMessage: null,
        pastErrorMessage: null,
      );
    }

    final scheduledResult = await _loadSection(
      fetch: (sportId, leagueId) => getScheduledMatches(
        pagination: const PaginationParams(page: 1, perPage: 30),
        filters: MatchFilters(sportId: sportId, leagueId: leagueId),
      ),
    );

    final pastResult = await _loadSection(
      fetch: (sportId, leagueId) => getPastMatches(
        pagination: const PaginationParams(page: 1, perPage: 30),
        filters: MatchFilters(sportId: sportId, leagueId: leagueId),
      ),
    );

    // Guard: don't update state if disposed
    if (_isDisposed) {
      _isFetching = false;
      return;
    }

    state = state.copyWith(
      scheduledMatches: scheduledResult.matches,
      pastMatches: pastResult.matches,
      scheduledErrorMessage: scheduledResult.errorMessage,
      pastErrorMessage: pastResult.errorMessage,
      isLoading: false,
      lastUpdated: DateTime.now().toUtc(),
    );

    _isFetching = false;
  }

  Future<({List<Match> matches, String? errorMessage})> _loadSection({
    required Future<Either<Failure, List<Match>>> Function(String, String?) fetch,
  }) async {
    final primaryResult = await fetch(_sportId, _leagueId);

    final primaryMatches = primaryResult.fold((_) => const <Match>[], (m) => m);

    if (primaryMatches.isNotEmpty) {
      return (matches: primaryMatches, errorMessage: null);
    }

    final fallbackResult = await fetch(_sportId, null);
    return fallbackResult.fold(
      (failure) => (matches: const <Match>[], errorMessage: failure.message),
      (matches) => (matches: matches, errorMessage: null),
    );
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}

final resultsProvider =
    StateNotifierProvider.autoDispose<_ResultsNotifier, ResultsState>((ref) {
  final getPastMatches = ref.watch(getPastMatchesUseCaseProvider);
  final getScheduledMatches = ref.watch(getScheduledMatchesUseCaseProvider);
  final sportId = ref.watch(selectedSportIdProvider);
  final leagueId = ref.watch(selectedLeagueIdProvider);

  final notifier = _ResultsNotifier(
    getPastMatches: getPastMatches,
    getScheduledMatches: getScheduledMatches,
    initialSportId: sportId,
    initialLeagueId: leagueId,
  );

  // Sync sport selection
  ref.listen<String>(selectedSportIdProvider, (prev, next) {
    // Guard: only sync if actually changed and notifier isn't already at this state
    if (prev != null && prev != next && next != notifier.selectedSportId) {
      notifier.selectSport(next);
    }
  });

  // Sync league selection
  ref.listen<String?>(selectedLeagueIdProvider, (prev, next) {
    // Guard: only sync if actually changed and notifier isn't already at this state
    if (prev != next && next != notifier.selectedLeagueId) {
      notifier.selectLeague(next);
    }
  });

  return notifier;
});

// ─────────────────────────────────────────────────────────────────────────
// MATCH DETAIL STATE NOTIFIER & PROVIDER
// ─────────────────────────────────────────────────────────────────────────

class _MatchDetailNotifier extends StateNotifier<MatchDetailState> {
  _MatchDetailNotifier({
    required this.args,
    required this.getMatchCommentary,
    required this.notificationPreferences,
  }) : super(MatchDetailState.fallback(args.matchId)) {
    if (args.initialMatch != null) {
      state = state.copyWith(match: args.initialMatch!);
    }
    _livePollingInterval = PollingConfig.matchDetailLive;
    _idlePollingInterval = PollingConfig.matchDetailIdle;
    _start();
  }

  final MatchDetailArgs args;
  final GetMatchCommentary getMatchCommentary;
  final MatchNotificationPreferences notificationPreferences;

  late Duration _livePollingInterval;
  late Duration _idlePollingInterval;
  bool _isDisposed = false;
  bool _isFetching = false;

  void _start() {
    unawaited(_pollLoop());
    unawaited(_fetch(silent: false));
  }

  Future<void> _pollLoop() async {
    while (!_isDisposed) {
      final wait = state.match.isLive ? _livePollingInterval : _idlePollingInterval;
      await Future<void>.delayed(wait);
      if (_isDisposed) break;
      await _fetch(silent: true);
    }
  }

  Future<void> refresh() => _fetch(silent: false);

  Future<void> _fetch({required bool silent}) async {
    if (_isFetching || _isDisposed) return;
    _isFetching = true;

    if (!silent) {
      state = state.copyWith(isLoading: true);
    }

    // Simplified: just fetch commentary. For a complete implementation,
    // you'd also fetch match details and events from the repository.
    final commentaryResult = await getMatchCommentary(args.matchId);

    commentaryResult.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        );
      },
      (commentary) {
        state = state.copyWith(
          commentary: commentary,
          isLoading: false,
          errorMessage: null,
          lastUpdated: DateTime.now().toUtc(),
        );
      },
    );

    _isFetching = false;
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}

final matchDetailProvider =
    StateNotifierProvider.autoDispose.family<_MatchDetailNotifier, MatchDetailState, MatchDetailArgs>(
  (ref, args) {
    final getMatchCommentary = ref.watch(getMatchCommentaryUseCaseProvider);
    final notificationPreferences = ref.watch(matchNotificationPreferencesProvider);

    final notifier = _MatchDetailNotifier(
      args: args,
      getMatchCommentary: getMatchCommentary,
      notificationPreferences: notificationPreferences,
    );

    return notifier;
  },
);

// ─────────────────────────────────────────────────────────────────────────
// UTILITIES
// ─────────────────────────────────────────────────────────────────────────

String _canonicalSportId(String value) {
  if (value.toLowerCase() == 'soccer') {
    return 'football';
  }
  return value.toLowerCase();
}
