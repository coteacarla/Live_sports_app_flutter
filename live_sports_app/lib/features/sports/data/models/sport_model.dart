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
}