import 'package:equatable/equatable.dart';

/// A team or competitor participating in matches.
class Team extends Equatable {
  const Team({
    required this.id,
    required this.name,
    this.shortName,
    this.logoUrl,
    this.countryCode,
    this.leagueId,
  });

  final String id;

  /// Full team name, e.g. "Manchester City FC".
  final String name;

  /// Abbreviated name for compact displays, e.g. "MCI".
  final String? shortName;

  final String? logoUrl;

  /// ISO 3166-1 alpha-2 code for the team's country.
  final String? countryCode;

  /// Primary league this team competes in.
  final String? leagueId;

  @override
  List<Object?> get props =>
      [id, name, shortName, logoUrl, countryCode, leagueId];
}