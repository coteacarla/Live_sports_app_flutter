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

  Team copyWith({
    String? id,
    String? name,
    Object? shortName = _unset,
    Object? logoUrl = _unset,
    Object? countryCode = _unset,
    Object? leagueId = _unset,
  }) {
    return Team(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName:
          identical(shortName, _unset) ? this.shortName : shortName as String?,
      logoUrl: identical(logoUrl, _unset) ? this.logoUrl : logoUrl as String?,
      countryCode: identical(countryCode, _unset)
          ? this.countryCode
          : countryCode as String?,
      leagueId:
          identical(leagueId, _unset) ? this.leagueId : leagueId as String?,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, shortName, logoUrl, countryCode, leagueId];
}

const Object _unset = Object();
