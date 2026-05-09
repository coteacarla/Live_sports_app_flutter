import '../../domain/entities/league.dart';


class LeagueModel extends League {
  const LeagueModel({
    required super.id,
    required super.name,
    required super.sportId,
    required super.type,
    super.country,
    super.logoUrl,
    super.currentSeason,
  });

  League toDomain() => League(
        id: id,
        name: name,
        sportId: sportId,
        type: type,
        country: country,
        logoUrl: logoUrl,
        currentSeason: currentSeason,
      );

  factory LeagueModel.fromDomain(League league) => LeagueModel(
        id: league.id,
        name: league.name,
        sportId: league.sportId,
        type: league.type,
        country: league.country,
        logoUrl: league.logoUrl,
        currentSeason: league.currentSeason,
      );
}