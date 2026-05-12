import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/team.dart';

part 'team_model.freezed.dart';
part 'team_model.g.dart';

@freezed
abstract class TeamModel with _$TeamModel {
  const TeamModel._();

  const factory TeamModel({
    required String id,
    required String name,
    String? shortName,
    String? logoUrl,
    String? countryCode,
    String? leagueId,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);

  factory TeamModel.fromDomain(Team team) => TeamModel(
        id: team.id,
        name: team.name,
        shortName: team.shortName,
        logoUrl: team.logoUrl,
        countryCode: team.countryCode,
        leagueId: team.leagueId,
      );

  Team toDomain() => Team(
        id: id,
        name: name,
        shortName: shortName,
        logoUrl: logoUrl,
        countryCode: countryCode,
        leagueId: leagueId,
      );
}