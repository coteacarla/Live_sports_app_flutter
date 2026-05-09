import 'package:equatable/equatable.dart';

import 'domain/entities/sport.dart';
import 'domain/entities/league.dart';

const Object _unset = Object();

/// State for Sports view (sports list and leagues for selected sport)
class SportsState extends Equatable {
  const SportsState({
    this.sports = const [],
    this.leagues = const [],
    this.isLoadingSports = true,
    this.isLoadingLeagues = true,
    this.sportsErrorMessage,
    this.leaguesErrorMessage,
    this.lastUpdated,
  });

  final List<Sport> sports;
  final List<League> leagues;
  final bool isLoadingSports;
  final bool isLoadingLeagues;
  final String? sportsErrorMessage;
  final String? leaguesErrorMessage;
  final DateTime? lastUpdated;

  factory SportsState.initial() => const SportsState();

  SportsState copyWith({
    List<Sport>? sports,
    List<League>? leagues,
    bool? isLoadingSports,
    bool? isLoadingLeagues,
    Object? sportsErrorMessage = _unset,
    Object? leaguesErrorMessage = _unset,
    Object? lastUpdated = _unset,
  }) {
    return SportsState(
      sports: sports ?? this.sports,
      leagues: leagues ?? this.leagues,
      isLoadingSports: isLoadingSports ?? this.isLoadingSports,
      isLoadingLeagues: isLoadingLeagues ?? this.isLoadingLeagues,
      sportsErrorMessage: identical(sportsErrorMessage, _unset)
          ? this.sportsErrorMessage
          : sportsErrorMessage as String?,
      leaguesErrorMessage: identical(leaguesErrorMessage, _unset)
          ? this.leaguesErrorMessage
          : leaguesErrorMessage as String?,
      lastUpdated: identical(lastUpdated, _unset)
          ? this.lastUpdated
          : lastUpdated as DateTime?,
    );
  }

  @override
  List<Object?> get props => [
        sports,
        leagues,
        isLoadingSports,
        isLoadingLeagues,
        sportsErrorMessage,
        leaguesErrorMessage,
        lastUpdated,
      ];
}
