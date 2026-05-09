import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/commentary.dart';
import '../repositories/matches_repository.dart';

class GetMatchCommentary {
	const GetMatchCommentary(this._repository);

	final MatchesRepository _repository;

	Future<Either<Failure, List<Commentary>>> call(
		String matchId, {
		int? since,
	}) {
		return _repository.getMatchCommentary(matchId, since: since);
	}
}
