import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/notifications/local_notification_service.dart';
import 'core/storage/hive_service.dart';

/// Runs in a separate isolate — must be a top-level function.
@pragma('vm:entry-point')
Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
  debugPrint('[FCM] Background message: ${message.notification?.title}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await HiveService.init();
  } catch (error, stackTrace) {
    debugPrint('Hive initialization failed: $error');
    debugPrintStack(stackTrace: stackTrace);
  }

  try {
    await LocalNotificationService().init();
  } catch (error, stackTrace) {
    debugPrint('Notification initialization failed: $error');
    debugPrintStack(stackTrace: stackTrace);
  }

  try {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);
    FirebaseMessaging.onMessage.listen((message) {
      debugPrint('[FCM] Foreground message: ${message.notification?.title}');
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint('[FCM] Notification tapped: ${message.notification?.title}');
    });
  } catch (error, stackTrace) {
    debugPrint('Firebase initialization failed: $error');
    debugPrintStack(stackTrace: stackTrace);
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const LiveSportsApp();
}
