import '../../../../core/error/failures.dart';
import '../../../../core/result.dart';
import '../entities/league.dart';
import '../entities/sport.dart';

abstract class SportsRepository {
  Future<Result<List<Sport>, Failure>> getSports();

  Future<Result<List<League>, Failure>> getLeaguesBySport(
    String sportId, {
    String? countryCode,
  });

}