import 'package:equatable/equatable.dart';

import '../../../sports/domain/entities/sport.dart';
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
    required this.sportType,
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
  final SportType sportType;

  String get sportId => sportType.apiValue;

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
  bool get isLive => isLiveStatus(status);

  /// Convenience getter: true after the final whistle.
  bool get isFinished => isFinishedStatus(status);

  /// Convenience getter: true before kick-off.
  bool get isScheduled => isScheduledStatus(status);

  /// Returns a display-friendly score string, e.g. "2 - 1" or "- : -".
  String get scoreDisplay => scoreDisplayFor(homeScore, awayScore);

  Match copyWith({
    String? id,
    String? leagueId,
    SportType? sportType,
    Team? homeTeam,
    Team? awayTeam,
    DateTime? scheduledAt,
    MatchStatus? status,
    Object? homeScore = _unset,
    Object? awayScore = _unset,
    Object? elapsed = _unset,
    Object? venue = _unset,
    Object? round = _unset,
  }) {
    return Match(
      id: id ?? this.id,
      leagueId: leagueId ?? this.leagueId,
      sportType: sportType ?? this.sportType,
      homeTeam: homeTeam ?? this.homeTeam,
      awayTeam: awayTeam ?? this.awayTeam,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      status: status ?? this.status,
      homeScore:
          identical(homeScore, _unset) ? this.homeScore : homeScore as int?,
      awayScore:
          identical(awayScore, _unset) ? this.awayScore : awayScore as int?,
      elapsed: identical(elapsed, _unset) ? this.elapsed : elapsed as int?,
      venue: identical(venue, _unset) ? this.venue : venue as String?,
      round: identical(round, _unset) ? this.round : round as String?,
    );
  }

  static bool isLiveStatus(MatchStatus status) =>
      status == MatchStatus.live || status == MatchStatus.paused;

  static bool isFinishedStatus(MatchStatus status) =>
      status == MatchStatus.finished;

  static bool isScheduledStatus(MatchStatus status) =>
      status == MatchStatus.scheduled || status == MatchStatus.prematch;

  static String scoreDisplayFor(int? homeScore, int? awayScore) {
    if (homeScore == null || awayScore == null) return '- : -';
    return '$homeScore - $awayScore';
  }

  @override
  List<Object?> get props => [
        id,
        leagueId,
        sportType,
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

const Object _unset = Object();
