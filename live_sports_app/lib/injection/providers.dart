import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/network/dio_client.dart';
import '../core/network/network_info.dart';
import '../core/notifications/match_notification_preferences.dart';
import '../core/notifications/local_notification_service.dart';

final connectivityProvider = Provider<Connectivity>((ref) => Connectivity());

final networkInfoProvider = Provider<NetworkInfo>(
	(ref) => NetworkInfoImpl(ref.watch(connectivityProvider)),
);

final dioClientProvider = Provider<DioClient>((ref) => DioClient());

final localNotificationServiceProvider = Provider<LocalNotificationService>(
	(ref) => LocalNotificationService(),
);

final matchNotificationPreferencesProvider =
	NotifierProvider<MatchNotificationPreferences, Set<String>>(
		MatchNotificationPreferences.new,
	);
