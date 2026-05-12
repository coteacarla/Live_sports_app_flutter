import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/commentary.dart';
import '../../domain/entities/match_event.dart';

part 'match_event_commentary.freezed.dart';
part 'match_event_commentary.g.dart';

@freezed
abstract class MatchEventModel with _$MatchEventModel {
  const MatchEventModel._();

  const factory MatchEventModel({
    required String id,
    required String matchId,
    required MatchEventType type,
    required int minute,
    String? teamId,
    String? playerId,
    String? playerName,
    String? assistPlayerId,
    String? assistPlayerName,
    int? extraMinute,
    String? detail,
  }) = _MatchEventModel;

  factory MatchEventModel.fromJson(Map<String, dynamic> json) =>
      _$MatchEventModelFromJson(json);

  MatchEvent toDomain() => MatchEvent(
        id: id,
        matchId: matchId,
        type: type,
        minute: minute,
        teamId: teamId,
        playerId: playerId,
        playerName: playerName,
        assistPlayerId: assistPlayerId,
        assistPlayerName: assistPlayerName,
        extraMinute: extraMinute,
        detail: detail,
      );
}

// ─────────────────────────────────────────────────────────────────────────────
// CommentaryModel
// ─────────────────────────────────────────────────────────────────────────────

@freezed
abstract class CommentaryModel with _$CommentaryModel {
  const CommentaryModel._();

  const factory CommentaryModel({
    required String id,
    required String matchId,
    required int minute,
    required String text,
    @Default(false) bool isKeyEvent,
    String? relatedEventId,
    DateTime? publishedAt,
  }) = _CommentaryModel;

  factory CommentaryModel.fromJson(Map<String, dynamic> json) =>
      _$CommentaryModelFromJson(json);

  Commentary toDomain() => Commentary(
        id: id,
        matchId: matchId,
        minute: minute,
        text: text,
        isKeyEvent: isKeyEvent,
        relatedEventId: relatedEventId,
        publishedAt: publishedAt,
      );
}