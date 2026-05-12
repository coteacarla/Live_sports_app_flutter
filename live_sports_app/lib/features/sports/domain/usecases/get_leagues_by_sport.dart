import '../../../../core/error/failures.dart';
import '../../../../core/result.dart';
import '../entities/league.dart';
import '../repositories/sports_repository.dart';

class GetLeaguesBySport {
	const GetLeaguesBySport(this._repository);

	final SportsRepository _repository;

	Future<Result<List<League>, Failure>> call(
		String sportId, {
		String? countryCode,
	}) {
		return _repository.getLeaguesBySport(sportId, countryCode: countryCode);
	}
}
