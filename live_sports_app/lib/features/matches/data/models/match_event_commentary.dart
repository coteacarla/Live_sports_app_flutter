import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/commentary.dart';
import '../../domain/entities/match_event.dart';

part 'match_event_commentary.freezed.dart';

@freezed
class MatchEventModel with _$MatchEventModel implements MatchEvent {
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

  @override
  String get minuteLabel {
    final base = "$minute'";
    if (extraMinute != null && extraMinute! > 0) return "$minute+$extraMinute'";
    return base;
  }

  @override
  List<Object?> get props => [
        id,
        matchId,
        type,
        minute,
        teamId,
        playerId,
        playerName,
        assistPlayerId,
        assistPlayerName,
        extraMinute,
        detail,
      ];

  @override
  bool? get stringify => true;
}

// ─────────────────────────────────────────────────────────────────────────────
// CommentaryModel
// ─────────────────────────────────────────────────────────────────────────────

@freezed
class CommentaryModel with _$CommentaryModel implements Commentary {
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

  Commentary toDomain() => Commentary(
        id: id,
        matchId: matchId,
        minute: minute,
        text: text,
        isKeyEvent: isKeyEvent,
        relatedEventId: relatedEventId,
        publishedAt: publishedAt,
      );

  @override
  List<Object?> get props => [
        id,
        matchId,
        minute,
        text,
        isKeyEvent,
        relatedEventId,
        publishedAt,
      ];

  @override
  bool? get stringify => true;
}