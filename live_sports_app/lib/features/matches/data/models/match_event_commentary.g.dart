// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_event_commentary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchEventModel _$MatchEventModelFromJson(Map<String, dynamic> json) =>
    _MatchEventModel(
      id: json['id'] as String,
      matchId: json['matchId'] as String,
      type: $enumDecode(_$MatchEventTypeEnumMap, json['type']),
      minute: (json['minute'] as num).toInt(),
      teamId: json['teamId'] as String?,
      playerId: json['playerId'] as String?,
      playerName: json['playerName'] as String?,
      assistPlayerId: json['assistPlayerId'] as String?,
      assistPlayerName: json['assistPlayerName'] as String?,
      extraMinute: (json['extraMinute'] as num?)?.toInt(),
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$MatchEventModelToJson(_MatchEventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'matchId': instance.matchId,
      'type': _$MatchEventTypeEnumMap[instance.type]!,
      'minute': instance.minute,
      'teamId': instance.teamId,
      'playerId': instance.playerId,
      'playerName': instance.playerName,
      'assistPlayerId': instance.assistPlayerId,
      'assistPlayerName': instance.assistPlayerName,
      'extraMinute': instance.extraMinute,
      'detail': instance.detail,
    };

const _$MatchEventTypeEnumMap = {
  MatchEventType.goal: 'goal',
  MatchEventType.ownGoal: 'ownGoal',
  MatchEventType.penalty: 'penalty',
  MatchEventType.missedPenalty: 'missedPenalty',
  MatchEventType.yellowCard: 'yellowCard',
  MatchEventType.redCard: 'redCard',
  MatchEventType.yellowRedCard: 'yellowRedCard',
  MatchEventType.substitution: 'substitution',
  MatchEventType.varReview: 'varReview',
  MatchEventType.kickOff: 'kickOff',
  MatchEventType.halfTime: 'halfTime',
  MatchEventType.fullTime: 'fullTime',
  MatchEventType.extraTimeStart: 'extraTimeStart',
  MatchEventType.penaltyShootoutStart: 'penaltyShootoutStart',
  MatchEventType.other: 'other',
};

_CommentaryModel _$CommentaryModelFromJson(Map<String, dynamic> json) =>
    _CommentaryModel(
      id: json['id'] as String,
      matchId: json['matchId'] as String,
      minute: (json['minute'] as num).toInt(),
      text: json['text'] as String,
      isKeyEvent: json['isKeyEvent'] as bool? ?? false,
      relatedEventId: json['relatedEventId'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
    );

Map<String, dynamic> _$CommentaryModelToJson(_CommentaryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'matchId': instance.matchId,
      'minute': instance.minute,
      'text': instance.text,
      'isKeyEvent': instance.isKeyEvent,
      'relatedEventId': instance.relatedEventId,
      'publishedAt': instance.publishedAt?.toIso8601String(),
    };
