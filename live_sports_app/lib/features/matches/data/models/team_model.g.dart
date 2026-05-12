// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeamModel _$TeamModelFromJson(Map<String, dynamic> json) => _TeamModel(
  id: json['id'] as String,
  name: json['name'] as String,
  shortName: json['shortName'] as String?,
  logoUrl: json['logoUrl'] as String?,
  countryCode: json['countryCode'] as String?,
  leagueId: json['leagueId'] as String?,
);

Map<String, dynamic> _$TeamModelToJson(_TeamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortName': instance.shortName,
      'logoUrl': instance.logoUrl,
      'countryCode': instance.countryCode,
      'leagueId': instance.leagueId,
    };
