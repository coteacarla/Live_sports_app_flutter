import 'package:equatable/equatable.dart';
import 'team.dart';

/// All possible lifecycle states of a match.
enum MatchStatus {
  /// Fixture has been announced but is not yet live.
  scheduled,

  /// Pre-match warm-up / waiting period.
  prematch,

  /// Match is currently in progress.
  live,

  /// Half-time, extra-time break, or equivalent pause.
  paused,

  /// Match has ended with an official result.
  finished,

  /// Match was postponed to a future date.
  postponed,

  /// Match was cancelled and will not be replayed.
  cancelled,

  /// Status could not be mapped (API returned an unknown value).
  unknown,
}

/// A single instance of a sports fixture between two competitors.
///
/// This entity covers the full lifecycle: scheduled → live → finished.
/// The [homeScore] and [awayScore] fields are null when the match has
/// not yet started; [elapsed] is null when the match is not live.
class Match extends Equatable {
  const Match({
    required this.id,
    required this.leagueId,
    required this.sportId,
    required this.homeTeam,
    required this.awayTeam,
    required this.scheduledAt,
    required this.status,
    this.homeScore,
    this.awayScore,
    this.elapsed,
    this.venue,
    this.round,
  });

  /// Unique fixture identifier from the API.
  final String id;

  final String leagueId;
  final String sportId;

  final Team homeTeam;
  final Team awayTeam;

  /// UTC kick-off time.
  final DateTime scheduledAt;

  final MatchStatus status;

  /// Current or final score for the home side. Null before kick-off.
  final int? homeScore;

  /// Current or final score for the away side. Null before kick-off.
  final int? awayScore;

  /// Minutes elapsed in the current half. Null when not live.
  final int? elapsed;

  /// Stadium / venue name.
  final String? venue;

  /// Competition round descriptor, e.g. "Matchday 12" or "Quarter-Final".
  final String? round;

  /// Convenience getter: true while the clock is running.
  bool get isLive => status == MatchStatus.live || status == MatchStatus.paused;

  /// Convenience getter: true after the final whistle.
  bool get isFinished => status == MatchStatus.finished;

  /// Convenience getter: true before kick-off.
  bool get isScheduled =>
      status == MatchStatus.scheduled || status == MatchStatus.prematch;

  /// Returns a display-friendly score string, e.g. "2 - 1" or "- : -".
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
}