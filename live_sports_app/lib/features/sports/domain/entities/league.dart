import 'package:equatable/equatable.dart';

import 'sport.dart';

enum LeagueType {
  domestic,
  continental,
  international,
  other,
}

class League extends Equatable {
  const League({
    required this.id,
    required this.name,
    required this.sportType,
    required this.type,
    this.country,
    this.logoUrl,
    this.currentSeason,
  });

  final String id;
  final String name;
  final SportType sportType;
  final LeagueType type;
  final String? country;
  final String? logoUrl;
  final String? currentSeason;

  String get sportId => sportType.apiValue;

  League copyWith({
    String? id,
    String? name,
    SportType? sportType,
    LeagueType? type,
    Object? country = _unset,
    Object? logoUrl = _unset,
    Object? currentSeason = _unset,
  }) {
    return League(
      id: id ?? this.id,
      name: name ?? this.name,
      sportType: sportType ?? this.sportType,
      type: type ?? this.type,
      country: identical(country, _unset) ? this.country : country as String?,
      logoUrl: identical(logoUrl, _unset) ? this.logoUrl : logoUrl as String?,
      currentSeason: identical(currentSeason, _unset)
          ? this.currentSeason
          : currentSeason as String?,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, sportType, type, country, logoUrl, currentSeason];
}

const Object _unset = Object();
