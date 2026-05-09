import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/match.dart';
import '../repositories/matches_repository.dart';

class GetPastMatches {
	const GetPastMatches(this._repository);

	final MatchesRepository _repository;

	Future<Either<Failure, List<Match>>> call({
		required PaginationParams pagination,
		MatchFilters filters = const MatchFilters(),
	}) {
		return _repository.getPastMatches(pagination: pagination, filters: filters);
	}
}
