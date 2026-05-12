import 'package:equatable/equatable.dart';

enum SportType {
  football,
  basketball,
  tennis,
  hockey,
  baseball,
  americanFootball,
  unknown;

  String get apiValue => switch (this) {
        SportType.football => 'football',
        SportType.basketball => 'basketball',
        SportType.tennis => 'tennis',
        SportType.hockey => 'hockey',
        SportType.baseball => 'baseball',
        SportType.americanFootball => 'american-football',
        SportType.unknown => 'unknown',
      };

  static SportType fromApiValue(String value) {
    final normalized = value.trim().toLowerCase();
    return switch (normalized) {
      'soccer' || 'football' => SportType.football,
      'basketball' => SportType.basketball,
      'tennis' => SportType.tennis,
      'hockey' => SportType.hockey,
      'baseball' => SportType.baseball,
      'american-football' || 'american football' => SportType.americanFootball,
      _ => SportType.unknown,
    };
  }
}

const Object _unset = Object();

class Sport extends Equatable {
  const Sport({
    required this.id,
    required this.name,
    required this.slug,
    this.iconUrl,
    this.isPopular = false,
  });

  final String id;
  final String name;
  final String slug;
  final String? iconUrl;
  final bool isPopular;

  Sport copyWith({
    String? id,
    String? name,
    String? slug,
    Object? iconUrl = _unset,
    bool? isPopular,
  }) {
    return Sport(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      iconUrl: identical(iconUrl, _unset) ? this.iconUrl : iconUrl as String?,
      isPopular: isPopular ?? this.isPopular,
    );
  }

  @override
  List<Object?> get props => [id, name, slug, iconUrl, isPopular];
}
