import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
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

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() run) async {
    final isConnected = await _networkInfo.isConnected;
    try {
      final result = await run();
      return Right(result);
    } on DioException catch (error) {
      if (!isConnected || error.type == DioExceptionType.connectionError) {
        return const Left(NetworkFailure());
      }
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.sendTimeout) {
        return const Left(TimeoutFailure());
      }
      return Left(
        ServerFailure(
          message: error.message ?? 'Remote request failed.',
          statusCode: error.response?.statusCode,
        ),
      );
    } catch (_) {
      return const Left(UnknownFailure(message: 'Unexpected matches error.'));
    }
  }

  @override
  Future<Either<Failure, List<Match>>> getLiveMatches({String? sportId}) {
    return _guard(() async {
      final items = await _remoteDataSource.getLiveMatches(sportId: sportId);
      return items.map((item) => item.toDomain()).toList(growable: false);
    });
  }

  @override
  Future<Either<Failure, List<Match>>> getLiveMatchesByLeague(
    String leagueId, {
    String? sportId,
  }) {
    return _guard(() async {
      final items = await _remoteDataSource.getLiveMatchesByLeague(
        leagueId,
        sportId: sportId,
      );
      return items.map((item) => item.toDomain()).toList(growable: false);
    });
  }

  @override
  Future<Either<Failure, List<Match>>> getPastMatches({
    required PaginationParams pagination,
    MatchFilters filters = const MatchFilters(),
  }) {
    return _guard(() async {
      final items = await _remoteDataSource.getPastMatches(
        pagination: pagination,
        filters: filters,
      );
      return items.map((item) => item.toDomain()).toList(growable: false);
    });
  }

  @override
  Future<Either<Failure, List<Match>>> getScheduledMatches({
    required PaginationParams pagination,
    MatchFilters filters = const MatchFilters(),
  }) {
    return _guard(() async {
      final items = await _remoteDataSource.getScheduledMatches(
        pagination: pagination,
        filters: filters,
      );
      return items.map((item) => item.toDomain()).toList(growable: false);
    });
  }

  @override
  Future<Either<Failure, List<Match>>> getMatchesByDate(DateTime date) {
    return _guard(() async {
      final items = await _remoteDataSource.getMatchesByDate(date);
      return items.map((item) => item.toDomain()).toList(growable: false);
    });
  }

  @override
  Future<Either<Failure, Match>> getMatchById(String matchId) {
    return _guard(() async => (await _remoteDataSource.getMatchById(matchId)).toDomain());
  }

  @override
  Future<Either<Failure, List<MatchEvent>>> getMatchEvents(String matchId) {
    return _guard(() async {
      final items = await _remoteDataSource.getMatchEvents(matchId);
      return items.map((item) => item.toDomain()).toList(growable: false);
    });
  }

  @override
  Future<Either<Failure, List<Commentary>>> getMatchCommentary(
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