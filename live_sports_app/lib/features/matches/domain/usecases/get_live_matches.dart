import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/match.dart';
import '../repositories/matches_repository.dart';

class GetLiveMatches {
	const GetLiveMatches(this._repository);

	final MatchesRepository _repository;

	Future<Either<Failure, List<Match>>> call({
		String? leagueId,
		String? sportId,
	}) {
		if (leagueId == null || leagueId.isEmpty) {
			return _repository.getLiveMatches(sportId: sportId);
		}
		return _repository.getLiveMatchesByLeague(leagueId, sportId: sportId);
	}
}
