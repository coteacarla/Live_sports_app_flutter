import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/sport.dart';
import '../repositories/sports_repository.dart';

class GetSports {
	const GetSports(this._repository);

	final SportsRepository _repository;

	Future<Either<Failure, List<Sport>>> call() {
		return _repository.getSports();
	}
}
