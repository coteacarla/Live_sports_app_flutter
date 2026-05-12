import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  LocalNotificationService._()
      : _plugin = FlutterLocalNotificationsPlugin(),
        _nextId = 0;

  static final LocalNotificationService _instance = LocalNotificationService._();

  factory LocalNotificationService() => _instance;

  final FlutterLocalNotificationsPlugin _plugin;
  int _nextId;

  Future<bool> init() async {
    const androidSettings = AndroidInitializationSettings('app_icon');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _plugin.initialize(
      const InitializationSettings(android: androidSettings, iOS: iosSettings),
    );

    final iosPlugin = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    if (iosPlugin != null) {
      await iosPlugin.requestPermissions(alert: true, badge: true, sound: true);
    }

    return true;
  }

  Future<int> showInstantNotification({
    required String title,
    required String body,
  }) async {
    final id = ++_nextId;
    try {
      await _plugin.show(
        id,
        title,
        body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'live_match_updates',
            'Live Match Updates',
            channelDescription: 'Live score and status updates for followed matches',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
      );
      return id;
    } catch (_) {
      return -1;
    }
  }

  Future<void> cancelAllNotifications() async {
    await _plugin.cancelAll();
  }
}
