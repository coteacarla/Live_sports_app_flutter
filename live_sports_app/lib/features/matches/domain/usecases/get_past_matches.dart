import '../../../../core/error/failures.dart';
import '../../../../core/result.dart';
import '../entities/match.dart';
import '../repositories/matches_repository.dart';

class GetPastMatches {
	const GetPastMatches(this._repository);

	final MatchesRepository _repository;

	Future<Result<List<Match>, Failure>> call({
		required PaginationParams pagination,
		MatchFilters filters = const MatchFilters(),
	}) {
		return _repository.getPastMatches(pagination: pagination, filters: filters);
	}
}
