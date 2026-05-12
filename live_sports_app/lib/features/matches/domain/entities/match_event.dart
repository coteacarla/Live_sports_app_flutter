import 'package:equatable/equatable.dart';

/// The type of notable incident that occurred during the match.
enum MatchEventType {
  goal,
  ownGoal,
  penalty,
  missedPenalty,
  yellowCard,
  redCard,
  yellowRedCard,
  substitution,
  varReview,
  kickOff,
  halfTime,
  fullTime,
  extraTimeStart,
  penaltyShootoutStart,
  other,
}

/// A discrete, notable incident during a match (goal, card, substitution, etc.).
class MatchEvent extends Equatable {
  const MatchEvent({
    required this.id,
    required this.matchId,
    required this.type,
    required this.minute,
    this.teamId,
    this.playerId,
    this.playerName,
    this.assistPlayerId,
    this.assistPlayerName,
    this.extraMinute,
    this.detail,
  });

  final String id;
  final String matchId;
  final MatchEventType type;
  final int minute;
  final String? teamId;
  final String? playerId;
  final String? playerName;
  final String? assistPlayerId;
  final String? assistPlayerName;
  final int? extraMinute;
  final String? detail;

  MatchEvent copyWith({
    String? id,
    String? matchId,
    MatchEventType? type,
    int? minute,
    Object? teamId = _unset,
    Object? playerId = _unset,
    Object? playerName = _unset,
    Object? assistPlayerId = _unset,
    Object? assistPlayerName = _unset,
    Object? extraMinute = _unset,
    Object? detail = _unset,
  }) {
    return MatchEvent(
      id: id ?? this.id,
      matchId: matchId ?? this.matchId,
      type: type ?? this.type,
      minute: minute ?? this.minute,
      teamId: identical(teamId, _unset) ? this.teamId : teamId as String?,
      playerId:
          identical(playerId, _unset) ? this.playerId : playerId as String?,
      playerName: identical(playerName, _unset)
          ? this.playerName
          : playerName as String?,
      assistPlayerId: identical(assistPlayerId, _unset)
          ? this.assistPlayerId
          : assistPlayerId as String?,
      assistPlayerName: identical(assistPlayerName, _unset)
          ? this.assistPlayerName
          : assistPlayerName as String?,
      extraMinute: identical(extraMinute, _unset)
          ? this.extraMinute
          : extraMinute as int?,
      detail: identical(detail, _unset) ? this.detail : detail as String?,
    );
  }

  /// Human-readable minute label, e.g. "45+2'" or "67'".
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
}

const Object _unset = Object();
