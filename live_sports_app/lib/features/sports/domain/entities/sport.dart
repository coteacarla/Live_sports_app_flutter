import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [id, name, slug, iconUrl, isPopular];
}