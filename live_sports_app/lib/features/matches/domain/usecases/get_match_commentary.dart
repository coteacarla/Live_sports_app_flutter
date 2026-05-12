import '../../../../core/error/failures.dart';
import '../../../../core/result.dart';
import '../entities/commentary.dart';
import '../repositories/matches_repository.dart';

class GetMatchCommentary {
	const GetMatchCommentary(this._repository);

	final MatchesRepository _repository;

	Future<Result<List<Commentary>, Failure>> call(
		String matchId, {
		int? since,
	}) {
		return _repository.getMatchCommentary(matchId, since: since);
	}
}
