import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/league.dart';
import '../../domain/entities/sport.dart';
import '../../domain/repositories/sports_repository.dart';
import '../datasources/sports_remote_datasource.dart';

class SportsRepositoryImpl implements SportsRepository {
	const SportsRepositoryImpl({
		required SportsRemoteDataSource remoteDataSource,
		required NetworkInfo networkInfo,
	})  : _remoteDataSource = remoteDataSource,
				_networkInfo = networkInfo;

	final SportsRemoteDataSource _remoteDataSource;
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
			return const Left(UnknownFailure(message: 'Unexpected sports error.'));
		}
	}

	@override
	Future<Either<Failure, List<Sport>>> getSports() async {
		return _guard(() async {
			final sports = await _remoteDataSource.getSports();
			return sports.map((item) => item.toDomain()).toList(growable: false);
		});
	}

	@override
	Future<Either<Failure, List<League>>> getLeaguesBySport(
		String sportId, {
		String? countryCode,
	}) async {
		return _guard(() async {
			final leagues = await _remoteDataSource.getLeaguesBySport(
				sportId,
				countryCode: countryCode,
			);
			return leagues.map((item) => item.toDomain()).toList(growable: false);
		});
	}

	@override
	Future<Either<Failure, League>> getLeagueById(String leagueId) async {
		return _guard(() async {
			final league = await _remoteDataSource.getLeagueById(leagueId);
			return league.toDomain();
		});
	}

	@override
	Future<Either<Failure, List<League>>> getFeaturedLeagues() async {
		return _guard(() async {
			final leagues = await _remoteDataSource.getFeaturedLeagues();
			return leagues.map((item) => item.toDomain()).toList(growable: false);
		});
	}
}
