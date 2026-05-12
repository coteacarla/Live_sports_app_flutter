import '../../domain/entities/sport.dart';

class SportModel extends Sport {
  const SportModel({
    required super.id,
    required super.name,
    required super.slug,
    super.iconUrl,
    super.isPopular,
  });

  Sport toDomain() => Sport(
        id: id,
        name: name,
        slug: slug,
        iconUrl: iconUrl,
        isPopular: isPopular,
      );

  factory SportModel.fromDomain(Sport sport) => SportModel(
        id: sport.id,
        name: sport.name,
        slug: sport.slug,
        iconUrl: sport.iconUrl,
        isPopular: sport.isPopular,
      );

  factory SportModel.fromJson(Map<String, dynamic> json) => SportModel(
        id: (json['idSport'] ?? json['id'] ?? '').toString(),
        name: (json['strSport'] ?? json['name'] ?? '').toString(),
        slug: _canonicalSlug(
          ((json['strSport'] ?? json['name'] ?? '') as String)
              .toLowerCase()
              .replaceAll(RegExp(r'\s+'), '-'),
        ),
        iconUrl: (json['strSportThumb'] ?? json['icon_url'])?.toString(),
        isPopular: const {'Soccer', 'Basketball', 'Tennis'}
            .contains((json['strSport'] ?? '').toString()),
      );

  static String _canonicalSlug(String slug) {
    if (slug == 'soccer') return 'football';
    return slug;
  }
}