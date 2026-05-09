import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/league.dart';
import '../entities/sport.dart';

abstract class SportsRepository {
  
  Future<Either<Failure, List<Sport>>> getSports();

  Future<Either<Failure, List<League>>> getLeaguesBySport(
    String sportId, {
    String? countryCode,
  });

  Future<Either<Failure, League>> getLeagueById(String leagueId);
  Future<Either<Failure, List<League>>> getFeaturedLeagues();
}