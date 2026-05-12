import '../../../../core/error/failures.dart';
import '../../../../core/result.dart';
import '../entities/commentary.dart';
import '../entities/match.dart';

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
	Future<Result<List<Match>, Failure>> getLiveMatches({String? sportId});

	/// Fetches live matches filtered by a specific league.
	  Future<Result<List<Match>, Failure>> getLiveMatchesByLeague(
		String leagueId, {
		String? sportId,
	});

	// ── Past / results ────────────────────────────────────────────────────────

	/// Fetches completed matches, sorted most-recent first.
	  Future<Result<List<Match>, Failure>> getPastMatches({
		required PaginationParams pagination,
		MatchFilters filters = const MatchFilters(),
	});

	// ── Scheduled ─────────────────────────────────────────────────────────────

	/// Fetches upcoming fixtures sorted by kick-off time ascending.
	  Future<Result<List<Match>, Failure>> getScheduledMatches({
		required PaginationParams pagination,
		MatchFilters filters = const MatchFilters(),
	});

	// ── Single match ──────────────────────────────────────────────────────────

	Future<Result<Match, Failure>> getMatchById(String matchId);

	// ── Commentary ────────────────────────────────────────────────────────────

	/// Fetches the live text commentary feed for [matchId].
	  Future<Result<List<Commentary>, Failure>> getMatchCommentary(
		String matchId, {
		int? since,
		String? sportId,
	});
}
