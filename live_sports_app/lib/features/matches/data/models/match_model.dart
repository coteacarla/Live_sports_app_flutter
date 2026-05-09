import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/match.dart';
import 'team_model.dart';

part 'match_model.freezed.dart';

@freezed
class MatchModel with _$MatchModel implements Match {
  const MatchModel._();

  const factory MatchModel({
    required String id,
    required String leagueId,
    required String sportId,
    required TeamModel homeTeam,
    required TeamModel awayTeam,
    required DateTime scheduledAt,
    required MatchStatus status,
    int? homeScore,
    int? awayScore,
    int? elapsed,
    String? venue,
    String? round,
  }) = _MatchModel;

  Match toDomain() => Match(
        id: id,
        leagueId: leagueId,
        sportId: sportId,
        homeTeam: homeTeam,
        awayTeam: awayTeam,
        scheduledAt: scheduledAt,
        status: status,
        homeScore: homeScore,
        awayScore: awayScore,
        elapsed: elapsed,
        venue: venue,
        round: round,
      );

  @override
  bool get isLive => status == MatchStatus.live || status == MatchStatus.paused;

  @override
  bool get isFinished => status == MatchStatus.finished;

  @override
  bool get isScheduled =>
      status == MatchStatus.scheduled || status == MatchStatus.prematch;

  @override
  String get scoreDisplay {
    if (homeScore == null || awayScore == null) return '- : -';
    return '$homeScore - $awayScore';
  }

  @override
  List<Object?> get props => [
        id,
        leagueId,
        sportId,
        homeTeam,
        awayTeam,
        scheduledAt,
        status,
        homeScore,
        awayScore,
        elapsed,
        venue,
        round,
      ];

  @override
  bool? get stringify => true;
}