import 'package:equatable/equatable.dart';

import 'domain/entities/match.dart';
import 'domain/entities/commentary.dart';
import 'domain/entities/team.dart';
import '../sports/domain/entities/sport.dart';

const Object _unset = Object();

/// State for Live Matches view
class LiveMatchesState extends Equatable {
  const LiveMatchesState({
    this.matches = const [],
    this.isLoading = true,
    this.errorMessage,
    this.lastUpdated,
  });

  final List<Match> matches;
  final bool isLoading;
  final String? errorMessage;
  final DateTime? lastUpdated;
  factory LiveMatchesState.initial() => const LiveMatchesState();

  LiveMatchesState copyWith({
    List<Match>? matches,
    bool? isLoading,
    Object? errorMessage = _unset,
    Object? lastUpdated = _unset,
  }) {
    return LiveMatchesState(
      matches: matches ?? this.matches,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: identical(errorMessage, _unset)
          ? this.errorMessage
          : errorMessage as String?,
      lastUpdated: identical(lastUpdated, _unset)
          ? this.lastUpdated
          : lastUpdated as DateTime?,
    );
  }

  @override
  List<Object?> get props => [matches, isLoading, errorMessage, lastUpdated];
}

/// State for Results (scheduled + past matches) view
class ResultsState extends Equatable {
  const ResultsState({
    this.scheduledMatches = const [],
    this.pastMatches = const [],
    this.isLoading = true,
    this.scheduledErrorMessage,
    this.pastErrorMessage,
    this.lastUpdated,
  });

  final List<Match> scheduledMatches;
  final List<Match> pastMatches;
  final bool isLoading;
  final String? scheduledErrorMessage;
  final String? pastErrorMessage;
  final DateTime? lastUpdated;

  factory ResultsState.initial() => const ResultsState();

  ResultsState copyWith({
    List<Match>? scheduledMatches,
    List<Match>? pastMatches,
    bool? isLoading,
    Object? scheduledErrorMessage = _unset,
    Object? pastErrorMessage = _unset,
    Object? lastUpdated = _unset,
  }) {
    return ResultsState(
      scheduledMatches: scheduledMatches ?? this.scheduledMatches,
      pastMatches: pastMatches ?? this.pastMatches,
      isLoading: isLoading ?? this.isLoading,
      scheduledErrorMessage: identical(scheduledErrorMessage, _unset)
          ? this.scheduledErrorMessage
          : scheduledErrorMessage as String?,
      pastErrorMessage: identical(pastErrorMessage, _unset)
          ? this.pastErrorMessage
          : pastErrorMessage as String?,
      lastUpdated: identical(lastUpdated, _unset)
          ? this.lastUpdated
          : lastUpdated as DateTime?,
    );
  }

  @override
  List<Object?> get props => [
        scheduledMatches,
        pastMatches,
        isLoading,
        scheduledErrorMessage,
        pastErrorMessage,
        lastUpdated,
      ];
}

/// State for Match Detail view with live polling
class MatchDetailState extends Equatable {
  const MatchDetailState({
    required this.match,
    this.commentary = const [],
    this.isLoading = false,
    this.errorMessage,
    this.lastUpdated,
  });

  final Match match;
  final List<Commentary> commentary;
  final bool isLoading;
  final String? errorMessage;
  final DateTime? lastUpdated;

  /// Fallback state when match data is initially unknown
  factory MatchDetailState.fallback(String matchId) => MatchDetailState(
        match: Match(
          id: matchId,
          leagueId: '',
          sportType: SportType.football,
          homeTeam: const Team(id: 'unknown_home', name: 'Home Team'),
          awayTeam: const Team(id: 'unknown_away', name: 'Away Team'),
          scheduledAt: DateTime.now().toUtc(),
          status: MatchStatus.unknown,
        ),
        commentary: const [],
        isLoading: true,
      );

  MatchDetailState copyWith({
    Match? match,
    List<Commentary>? commentary,
    bool? isLoading,
    Object? errorMessage = _unset,
    Object? lastUpdated = _unset,
  }) {
    return MatchDetailState(
      match: match ?? this.match,
      commentary: commentary ?? this.commentary,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: identical(errorMessage, _unset)
          ? this.errorMessage
          : errorMessage as String?,
      lastUpdated: identical(lastUpdated, _unset)
          ? this.lastUpdated
          : lastUpdated as DateTime?,
    );
  }

  @override
  List<Object?> get props =>
      [match, commentary, isLoading, errorMessage, lastUpdated];
}

/// Arguments container for Match Detail controller
class MatchDetailArgs extends Equatable {
  const MatchDetailArgs({
    required this.matchId,
    this.initialMatch,
  });

  final String matchId;
  final Match? initialMatch;

  MatchDetailArgs copyWith({
    String? matchId,
    Object? initialMatch = _unset,
  }) {
    return MatchDetailArgs(
      matchId: matchId ?? this.matchId,
      initialMatch: identical(initialMatch, _unset)
          ? this.initialMatch
          : initialMatch as Match?,
    );
  }

  @override
  List<Object?> get props => [matchId, initialMatch];
}
