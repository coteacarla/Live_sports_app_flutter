import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/league.dart';
import '../repositories/sports_repository.dart';

class GetLeaguesBySport {
	const GetLeaguesBySport(this._repository);

	final SportsRepository _repository;

	Future<Either<Failure, List<League>>> call(
		String sportId, {
		String? countryCode,
	}) {
		return _repository.getLeaguesBySport(sportId, countryCode: countryCode);
	}
}
