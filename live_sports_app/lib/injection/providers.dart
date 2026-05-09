import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/network/dio_client.dart';
import '../core/network/network_info.dart';
import '../core/notifications/match_notification_preferences.dart';
import '../core/notifications/local_notification_service.dart';
import '../features/matches/data/datasources/matches_remote_datasource.dart';
import '../features/matches/data/repositories/matches_repository_impl.dart';
import '../features/matches/domain/repositories/matches_repository.dart';
import '../features/matches/domain/usecases/get_live_matches.dart';
import '../features/matches/domain/usecases/get_match_commentary.dart';
import '../features/matches/domain/usecases/get_past_matches.dart';
import '../features/matches/domain/usecases/get_scheduled_matches.dart';
import '../features/sports/data/datasources/sports_remote_datasource.dart';
import '../features/sports/data/repositories/sports_repository_impl.dart';
import '../features/sports/domain/repositories/sports_repository.dart';
import '../features/sports/domain/usecases/get_leagues_by_sport.dart';
import '../features/sports/domain/usecases/get_sports.dart';

final connectivityProvider = Provider<Connectivity>((ref) => Connectivity());

final networkInfoProvider = Provider<NetworkInfo>(
	(ref) => NetworkInfoImpl(ref.watch(connectivityProvider)),
);

final dioClientProvider = Provider<DioClient>((ref) => DioClient());

// ── Sports ────────────────────────────────────────────────────────────────

final sportsRemoteDataSourceProvider = Provider<SportsRemoteDataSource>(
	(ref) => SportsRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)),
);

final sportsRepositoryProvider = Provider<SportsRepository>(
	(ref) => SportsRepositoryImpl(
		remoteDataSource: ref.watch(sportsRemoteDataSourceProvider),
		networkInfo: ref.watch(networkInfoProvider),
	),
);

final getSportsUseCaseProvider = Provider<GetSports>(
	(ref) => GetSports(ref.watch(sportsRepositoryProvider)),
);

final getLeaguesBySportUseCaseProvider = Provider<GetLeaguesBySport>(
	(ref) => GetLeaguesBySport(ref.watch(sportsRepositoryProvider)),
);

// ── Matches ───────────────────────────────────────────────────────────────

final matchesRemoteDataSourceProvider = Provider<MatchesRemoteDataSource>(
	(ref) => MatchesRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)),
);

final matchesRepositoryProvider = Provider<MatchesRepository>(
	(ref) => MatchesRepositoryImpl(
		remoteDataSource: ref.watch(matchesRemoteDataSourceProvider),
		networkInfo: ref.watch(networkInfoProvider),
	),
);

final getLiveMatchesUseCaseProvider = Provider<GetLiveMatches>(
	(ref) => GetLiveMatches(ref.watch(matchesRepositoryProvider)),
);

final getPastMatchesUseCaseProvider = Provider<GetPastMatches>(
	(ref) => GetPastMatches(ref.watch(matchesRepositoryProvider)),
);

final getScheduledMatchesUseCaseProvider = Provider<GetScheduledMatches>(
	(ref) => GetScheduledMatches(ref.watch(matchesRepositoryProvider)),
);

final getMatchCommentaryUseCaseProvider = Provider<GetMatchCommentary>(
	(ref) => GetMatchCommentary(ref.watch(matchesRepositoryProvider)),
);

// ── Notifications ─────────────────────────────────────────────────────────

final localNotificationServiceProvider = Provider<LocalNotificationService>(
	(ref) => LocalNotificationService(),
);

final matchNotificationPreferencesProvider =
	ChangeNotifierProvider<MatchNotificationPreferences>(
		(ref) => MatchNotificationPreferences(),
	);

// Toggle to enable/disable instant notifications from the UI.
final notificationsEnabledProvider = StateProvider<bool>((ref) => true);
