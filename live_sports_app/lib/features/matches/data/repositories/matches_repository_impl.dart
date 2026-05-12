import 'package:dio/dio.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/result.dart';
import '../datasources/matches_remote_datasource.dart';
import '../../domain/entities/commentary.dart';
import '../../domain/entities/match.dart';
import '../../domain/entities/match_event.dart';
import '../../domain/repositories/matches_repository.dart';

class MatchesRepositoryImpl implements MatchesRepository {
  const MatchesRepositoryImpl({
    required MatchesRemoteDataSource remoteDataSource,
    required NetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _networkInfo = networkInfo;

  final MatchesRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  List<T> _mapSafe<TModel, T>(
    List<TModel> items,
    T Function(TModel) convert,
    String label,
  ) {
    final results = <T>[];
    var parsed = 0;
    for (final item in items) {
      try {
        results.add(convert(item));
        parsed++;
      } catch (e, st) {
        print('Parsing error for match: $e');
        print(st);
      }
    }
    print('Parsed $parsed matches successfully');
    return results;
  }

  Future<Result<T, Failure>> _guard<T>(Future<T> Function() run) async {
    try {
      final result = await run();
      return ResultSuccess(result);
    } on DioException catch (error) {
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected || error.type == DioExceptionType.connectionError) {
        return const ResultFailure(NetworkFailure());
      }
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.sendTimeout) {
        return const ResultFailure(TimeoutFailure());
      }
      return ResultFailure(
        ServerFailure(
          message: error.message,
          statusCode: error.response?.statusCode,
        ),
      );
    } catch (_) {
      return const ResultFailure(UnknownFailure());
    }
  }

  @override
  Future<Result<List<Match>, Failure>> getLiveMatches({String? sportId}) {
    return _guard(() async {
      final items = await _remoteDataSource.getLiveMatches(sportId: sportId);
      return _mapSafe(items, (item) => item.toDomain(), 'match');
    });
  }

  @override
  Future<Result<List<Match>, Failure>> getLiveMatchesByLeague(
    String leagueId, {
    String? sportId,
  }) {
    return _guard(() async {
      final items = await _remoteDataSource.getLiveMatchesByLeague(
        leagueId,
        sportId: sportId,
      );
      return _mapSafe(items, (item) => item.toDomain(), 'match');
    });
  }

  @override
  Future<Result<List<Match>, Failure>> getPastMatches({
    required PaginationParams pagination,
    MatchFilters filters = const MatchFilters(),
  }) {
    return _guard(() async {
      final items = await _remoteDataSource.getPastMatches(
        pagination: pagination,
        filters: filters,
      );
      return _mapSafe(items, (item) => item.toDomain(), 'match');
    });
  }

  @override
  Future<Result<List<Match>, Failure>> getScheduledMatches({
    required PaginationParams pagination,
    MatchFilters filters = const MatchFilters(),
  }) {
    return _guard(() async {
      final items = await _remoteDataSource.getScheduledMatches(
        pagination: pagination,
        filters: filters,
      );
      return _mapSafe(items, (item) => item.toDomain(), 'match');
    });
  }

  @override
  Future<Result<List<Match>, Failure>> getMatchesByDate(DateTime date) {
    return _guard(() async {
      final items = await _remoteDataSource.getMatchesByDate(date);
      return _mapSafe(items, (item) => item.toDomain(), 'match');
    });
  }

  @override
  Future<Result<Match, Failure>> getMatchById(String matchId) {
    return _guard(() async => (await _remoteDataSource.getMatchById(matchId)).toDomain());
  }

  @override
  Future<Result<List<MatchEvent>, Failure>> getMatchEvents(String matchId) {
    return _guard(() async {
      final items = await _remoteDataSource.getMatchEvents(matchId);
      return items.map((item) => item.toDomain()).toList(growable: false);
    });
  }

  @override
  Future<Result<List<Commentary>, Failure>> getMatchCommentary(
    String matchId, {
    int? since,
  }) {
    return _guard(() async {
      final items = await _remoteDataSource.getMatchCommentary(
        matchId,
        since: since,
      );
      return items.map((item) => item.toDomain()).toList(growable: false);
    });
  }
}