import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/commentary.dart';
import '../entities/match.dart';
import '../entities/match_event.dart';

/// Pagination parameters shared across paginated endpoints.
class PaginationParams {
	const PaginationParams({this.page = 1, this.perPage = 20});

	final int page;
	final int perPage;
}

/// Filtering options for match list queries.
class MatchFilters {
	const MatchFilters({
		this.leagueId,
		this.teamId,
		this.sportId,
		this.from,
		this.to,
		this.round,
	});

	final String? leagueId;
	final String? teamId;
	final String? sportId;
	final DateTime? from;
	final DateTime? to;

	/// Filter by competition round, e.g. "Matchday 5".
	final String? round;
}

/// Contract for all match data access: live, historical, scheduled, and timeline.
abstract class MatchesRepository {
	// ── Live ──────────────────────────────────────────────────────────────────

	/// Fetches all currently in-progress matches across all followed / popular leagues.
	Future<Either<Failure, List<Match>>> getLiveMatches({String? sportId});

	/// Fetches live matches filtered by a specific league.
	Future<Either<Failure, List<Match>>> getLiveMatchesByLeague(
		String leagueId, {
		String? sportId,
	});

	// ── Past / results ────────────────────────────────────────────────────────

	/// Fetches completed matches, sorted most-recent first.
	Future<Either<Failure, List<Match>>> getPastMatches({
		required PaginationParams pagination,
		MatchFilters filters = const MatchFilters(),
	});

	// ── Scheduled ─────────────────────────────────────────────────────────────

	/// Fetches upcoming fixtures sorted by kick-off time ascending.
	Future<Either<Failure, List<Match>>> getScheduledMatches({
		required PaginationParams pagination,
		MatchFilters filters = const MatchFilters(),
	});

	/// Fetches fixtures for a specific calendar date (UTC).
	Future<Either<Failure, List<Match>>> getMatchesByDate(DateTime date);

	// ── Single match ──────────────────────────────────────────────────────────

	/// Fetches full detail for a single match, including current score and status.
	Future<Either<Failure, Match>> getMatchById(String matchId);

	// ── Timeline / events ─────────────────────────────────────────────────────

	/// Fetches all notable incidents (goals, cards, substitutions) for [matchId].
	Future<Either<Failure, List<MatchEvent>>> getMatchEvents(String matchId);

	// ── Commentary ────────────────────────────────────────────────────────────

	/// Fetches the live text commentary feed for [matchId].
	Future<Either<Failure, List<Commentary>>> getMatchCommentary(
		String matchId, {
		int? since,
	});
}
