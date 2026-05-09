import 'package:equatable/equatable.dart';

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
    required this.sportId,
    required this.type,
    this.country,
    this.logoUrl,
    this.currentSeason,
  });

  final String id;
  final String name;
  final String sportId;
  final LeagueType type;
  final String? country;
  final String? logoUrl;
  final String? currentSeason;

  @override
  List<Object?> get props =>
      [id, name, sportId, type, country, logoUrl, currentSeason];
}