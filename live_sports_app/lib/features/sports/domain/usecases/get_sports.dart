import '../../../../core/error/failures.dart';
import '../../../../core/result.dart';
import '../entities/sport.dart';
import '../repositories/sports_repository.dart';

class GetSports {
	const GetSports(this._repository);

	final SportsRepository _repository;

	Future<Result<List<Sport>, Failure>> call() {
		return _repository.getSports();
	}
}
