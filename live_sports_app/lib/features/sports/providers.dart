import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../injection/providers.dart';
import '../matches/providers.dart';
import 'data/datasources/sports_remote_datasource.dart';
import 'data/repositories/sports_repository_impl.dart';
import 'domain/entities/league.dart';
import 'domain/entities/sport.dart';
import 'domain/repositories/sports_repository.dart';
import 'domain/usecases/get_leagues_by_sport.dart';
import 'domain/usecases/get_sports.dart';
import 'state.dart';

part 'providers.g.dart';

final sportsRemoteDataSourceProvider = Provider<SportsRemoteDataSource>(
  (ref) => SportsRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)),
);

final sportsRepositoryProvider = Provider<SportsRepository>(
  (ref) => SportsRepositoryImpl(
    remoteDataSource: ref.watch(sportsRemoteDataSourceProvider),
    networkInfo: ref.watch(networkInfoProvider),
  ),
);

final getSportsUseCaseProvider = Provider<GetSports>(
  (ref) => GetSports(ref.watch(sportsRepositoryProvider)),
);

final getLeaguesBySportUseCaseProvider = Provider<GetLeaguesBySport>(
  (ref) => GetLeaguesBySport(ref.watch(sportsRepositoryProvider)),
);

@riverpod
class Sports extends _$Sports {
  bool _isFetching = false;
  int _buildVersion = 0;
  String? _sportId;

  @override
  SportsState build() {
    _buildVersion++;
    final buildVersion = _buildVersion;

    final selectedSportId = ref.watch(selectedSportIdProvider);
    _sportId = selectedSportId.isEmpty ? null : selectedSportId;

    _isFetching = false;

    Future.microtask(() => _fetchAll(silent: false, buildVersion: buildVersion));
   
    return const SportsState(
      sports: <Sport>[],
      leagues: <League>[],
      isLoadingSports: true,
      isLoadingLeagues: true,
    );
  }

  Future<void> refresh() => _fetchAll(silent: false, buildVersion: _buildVersion);

  Future<void> _fetchAll({
    required bool silent,
    required int buildVersion,
  }) async {
    if (_isFetching || buildVersion != _buildVersion) return;
    _isFetching = true;

    if (!silent) {
      state = state.copyWith(
        isLoadingSports: true,
        isLoadingLeagues: true,
        sportsErrorMessage: null,
        leaguesErrorMessage: null,
      );
    }

    final sportsResult = await ref.read(getSportsUseCaseProvider)();
    sportsResult.fold(
    (items) => debugPrint('✅ Successfully fetched ${items.length} sports'), // LOG 2
    (failure) => debugPrint('❌ Sport Fetch Failed: ${failure.message}'),); // LOG 3);
    if (buildVersion != _buildVersion) {
      _isFetching = false;
      return;
    }

    final currentSports = state.sports;
    String? sportsError;
    final sports = sportsResult.fold(
      (items) => items,
      (failure) {
        if (currentSports.isEmpty) {
          sportsError = failure.message;
        }
        return currentSports;
      },
    );

    List<League> leagues = state.leagues;
    String? leaguesError;

    if (_sportId == null) {
      leagues = const <League>[];
    } else {
      final leaguesResult = await ref.read(getLeaguesBySportUseCaseProvider)(_sportId!);
      if (buildVersion != _buildVersion) {
        _isFetching = false;
        return;
      }

      final currentLeagues = state.leagues;
      leagues = leaguesResult.fold(
        (items) => items,
        (failure) {
          if (currentLeagues.isEmpty) {
            leaguesError = failure.message;
          }
          return currentLeagues;
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
}
