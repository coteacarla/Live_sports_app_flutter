import 'package:dio/dio.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/result.dart';
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
	Future<Result<List<Sport>, Failure>> getSports() async {
		return _guard(() async {
			final sports = await _remoteDataSource.getSports();
			return sports.map((item) => item.toDomain()).toList(growable: false);
		});
	}

	@override
	Future<Result<List<League>, Failure>> getLeaguesBySport(
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
	Future<Result<League, Failure>> getLeagueById(String leagueId) async {
		return _guard(() async {
			final league = await _remoteDataSource.getLeagueById(leagueId);
			return league.toDomain();
		});
	}

	@override
	Future<Result<List<League>, Failure>> getFeaturedLeagues() async {
		return _guard(() async {
			final leagues = await _remoteDataSource.getFeaturedLeagues();
			return leagues.map((item) => item.toDomain()).toList(growable: false);
		});
	}
}
