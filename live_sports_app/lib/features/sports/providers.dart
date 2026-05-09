import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../injection/providers.dart';
import 'data/datasources/sports_remote_datasource.dart';
import 'data/repositories/sports_repository_impl.dart';
import 'domain/repositories/sports_repository.dart';
import 'domain/usecases/get_sports.dart';
import 'domain/usecases/get_leagues_by_sport.dart';
import 'domain/entities/sport.dart';
import 'domain/entities/league.dart';
import 'state.dart';

// ─────────────────────────────────────────────────────────────────────────
// DATA LAYER PROVIDERS
// ─────────────────────────────────────────────────────────────────────────

final sportsRemoteDataSourceProvider = Provider<SportsRemoteDataSource>(
  (ref) => SportsRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)),
);

final sportsRepositoryProvider = Provider<SportsRepository>(
  (ref) => SportsRepositoryImpl(
    remoteDataSource: ref.watch(sportsRemoteDataSourceProvider),
    networkInfo: ref.watch(networkInfoProvider),
  ),
);

// ─────────────────────────────────────────────────────────────────────────
// DOMAIN LAYER PROVIDERS (UseCases)
// ─────────────────────────────────────────────────────────────────────────

final getSportsUseCaseProvider = Provider<GetSports>(
  (ref) => GetSports(ref.watch(sportsRepositoryProvider)),
);

final getLeaguesBySportUseCaseProvider = Provider<GetLeaguesBySport>(
  (ref) => GetLeaguesBySport(ref.watch(sportsRepositoryProvider)),
);

// ─────────────────────────────────────────────────────────────────────────
// FILTER PROVIDERS (Sync with matches feature filters)
// ─────────────────────────────────────────────────────────────────────────

// These are defined in matches/providers.dart and re-exported for convenience
// selectedSportIdProvider
// selectedLeagueIdProvider

// ─────────────────────────────────────────────────────────────────────────
// SPORTS STATE NOTIFIER & PROVIDER
// ─────────────────────────────────────────────────────────────────────────

class _SportsNotifier extends StateNotifier<SportsState> {
  _SportsNotifier({
    required this.getSports,
    required this.getLeaguesBySport,
    String? initialSportId,
  })  : _sportId = initialSportId == null ? null : _canonicalSportId(initialSportId),
        super(const SportsState()) {
    _fetchAll(silent: false);
  }

  final GetSports getSports;
  final GetLeaguesBySport getLeaguesBySport;

  bool _isFetching = false;
  bool _isFetchingLeagues = false;
  bool _isDisposed = false;
  String? _sportId;

  String? get selectedSportId => _sportId;

  Future<void> refresh() => _fetchAll(silent: false);

  void selectSport(String sportId) {
    final canonical = _canonicalSportId(sportId);
    if (canonical == _sportId) return;
    _sportId = canonical;
    state = state.copyWith(
      isLoadingLeagues: true,
      leaguesErrorMessage: null,
    );
    _fetchLeagues(sportId: canonical);
  }

  Future<void> _fetchAll({required bool silent}) async {
    if (_isFetching || _isDisposed) return;
    _isFetching = true;

    if (!silent) {
      state = state.copyWith(
        isLoadingSports: true,
        isLoadingLeagues: true,
        sportsErrorMessage: null,
        leaguesErrorMessage: null,
      );
    }

    final sportsResult = await getSports();
    
    // Guard: don't update state if disposed
    if (_isDisposed) {
      _isFetching = false;
      return;
    }

    final currentSports = state.sports;
    String? sportsError;
    final sports = sportsResult.fold(
      (failure) {
        if (currentSports.isEmpty) {
          sportsError = failure.message;
        }
        return currentSports;
      },
      (items) {
        sportsError = null;
        return items;
      },
    );

    final resolvedSportId = _resolveSelectedSport(sports);
    if (resolvedSportId != null) {
      _sportId = resolvedSportId;
    }

    List<League> leagues = state.leagues;
    String? leaguesError;

    if (_sportId == null) {
      leagues = const <League>[];
    } else {
      final leaguesResult = await getLeaguesBySport(_sportId!);
      final currentLeagues = state.leagues;
      leagues = leaguesResult.fold(
        (failure) {
          if (currentLeagues.isEmpty) {
            leaguesError = failure.message;
          }
          return currentLeagues;
        },
        (items) {
          leaguesError = null;
          return items;
        },
      );
    }

    state = state.copyWith(
      sports: sports,
      leagues: leagues,
      isLoadingSports: false,
      isLoadingLeagues: false,
      sportsErrorMessage: sportsError,
      leaguesErrorMessage: leaguesError,
      lastUpdated: DateTime.now().toUtc(),
    );

    _isFetching = false;
  }

  Future<void> _fetchLeagues({required String sportId}) async {
    if (_isFetchingLeagues || _isDisposed) return;
    _isFetchingLeagues = true;

    final leaguesResult = await getLeaguesBySport(sportId);
    
    // Guard: don't update state if disposed
    if (_isDisposed) {
      _isFetchingLeagues = false;
      return;
    }

    final currentLeagues = state.leagues;
    String? leaguesError;
    final leagues = leaguesResult.fold(
      (failure) {
        if (currentLeagues.isEmpty) {
          leaguesError = failure.message;
        }
        return currentLeagues;
      },
      (items) {
        leaguesError = null;
        return items;
      },
    );

    state = state.copyWith(
      leagues: leagues,
      isLoadingLeagues: false,
      leaguesErrorMessage: leaguesError,
      lastUpdated: DateTime.now().toUtc(),
    );

    _isFetchingLeagues = false;
  }

  String? _resolveSelectedSport(List<Sport> sports) {
    if (sports.isEmpty) return null;

    final preferred = _sportId == null ? null : _canonicalSportId(_sportId!);
    final hasPreferred = preferred != null &&
        sports.any((sport) => _canonicalSportId(sport.slug) == preferred);

    if (hasPreferred) return preferred;
    return _canonicalSportId(sports.first.slug);
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}

final sportsProvider =
    StateNotifierProvider.autoDispose<_SportsNotifier, SportsState>((ref) {
  final getSports = ref.watch(getSportsUseCaseProvider);
  final getLeaguesBySport = ref.watch(getLeaguesBySportUseCaseProvider);

  return _SportsNotifier(
    getSports: getSports,
    getLeaguesBySport: getLeaguesBySport,
  );
});

// ─────────────────────────────────────────────────────────────────────────
// UTILITIES
// ─────────────────────────────────────────────────────────────────────────

String _canonicalSportId(String value) {
  if (value.toLowerCase() == 'soccer') return 'football';
  return value.toLowerCase();
}
