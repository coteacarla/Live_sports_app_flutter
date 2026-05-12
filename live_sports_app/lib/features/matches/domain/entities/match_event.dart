import 'package:equatable/equatable.dart';

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
