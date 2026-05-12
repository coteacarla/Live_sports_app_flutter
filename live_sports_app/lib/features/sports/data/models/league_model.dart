import '../../domain/entities/league.dart';
import '../../domain/entities/sport.dart';

class LeagueModel extends League {
  const LeagueModel({
    required super.id,
    required super.name,
    required super.sportType,
    required super.type,
    super.country,
    super.logoUrl,
    super.currentSeason,
  });

  League toDomain() => League(
        id: id,
        name: name,
        sportType: sportType,
        type: type,
        country: country,
        logoUrl: logoUrl,
        currentSeason: currentSeason,
      );

  factory LeagueModel.fromDomain(League league) => LeagueModel(
        id: league.id,
        name: league.name,
        sportType: league.sportType,
        type: league.type,
        country: league.country,
        logoUrl: league.logoUrl,
        currentSeason: league.currentSeason,
      );

  factory LeagueModel.fromJson(
    Map<String, dynamic> json, {
    SportType? sportType,
  }) {
    final country = (json['strCountry'] as String?)?.trim();
    return LeagueModel(
      id: (json['idLeague'] ?? json['id'] ?? '').toString(),
      name: (json['strLeague'] ?? json['name'] ?? '').toString(),
      sportType: sportType ??
          SportType.fromApiValue((json['strSport'] ?? json['sport'] ?? '').toString()),
      type: country == null || country.isEmpty
          ? LeagueType.international
          : LeagueType.domestic,
      country: country?.isEmpty == true ? null : country,
      logoUrl: (json['strBadge'] ?? json['logo_url'])?.toString(),
      currentSeason:
          (json['strCurrentSeason'] ?? json['current_season'])?.toString(),
    );
  }
}
