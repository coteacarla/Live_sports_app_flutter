import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/match.dart';
import '../repositories/matches_repository.dart';

class GetScheduledMatches {
	const GetScheduledMatches(this._repository);

	final MatchesRepository _repository;

	Future<Either<Failure, List<Match>>> call({
		required PaginationParams pagination,
		MatchFilters filters = const MatchFilters(),
	}) {
		return _repository.getScheduledMatches(
			pagination: pagination,
			filters: filters,
		);
	}
}
