import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart';

/// Wrapper around flutter_local_notifications for cross-platform local alerts.
class LocalNotificationService {
  LocalNotificationService._()
      : _plugin = FlutterLocalNotificationsPlugin(),
        _nextId = 0;

  static final LocalNotificationService _instance = LocalNotificationService._();

  factory LocalNotificationService() => _instance;

  final FlutterLocalNotificationsPlugin _plugin;
  int _nextId;

  /// Initialize notification channels and request permissions.
  Future<bool> init() async {
    tz.initializeTimeZones();
    const androidSettings = AndroidInitializationSettings('app_icon');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _plugin.initialize(
      const InitializationSettings(android: androidSettings, iOS: iosSettings),
    );

    // For iOS 14+, request explicit permission at runtime.
    final iosPlugin = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    if (iosPlugin != null) {
      await iosPlugin.requestPermissions(alert: true, badge: true, sound: true);
    }

    return true;
  }

  /// Schedule a local notification for the given [dateTime].
  ///
  /// Returns the platform notification ID assigned.
  Future<int> scheduleNotification({
    required String title,
    required String body,
    required DateTime dateTime,
  }) async {
    final id = ++_nextId;

    try {
      await _plugin.zonedSchedule(
        id,
        title,
        body,
        TZDateTime.from(dateTime, local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'match_alerts',
            'Match Alerts',
            channelDescription: 'Notifications for followed matches',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(
            sound: 'default.aiff',
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );

      return id;
    } catch (e) {
      return -1;
    }
  }

  /// Schedule a notification when a match is expected to start.
  Future<int> scheduleMatchStartNotification({
    required String matchTitle,
    required DateTime dateTime,
    String? body,
  }) async {
    return scheduleNotification(
      title: 'Match starting: $matchTitle',
      body: body ?? 'The match is starting now.',
      dateTime: dateTime,
    );
  }

  /// Schedule a notification when a match is expected to end.
  Future<int> scheduleMatchEndNotification({
    required String matchTitle,
    required DateTime dateTime,
    String? body,
  }) async {
    return scheduleNotification(
      title: 'Match ended: $matchTitle',
      body: body ?? 'The match has finished.',
      dateTime: dateTime,
    );
  }

  /// Cancel a previously scheduled notification by its platform ID.
  Future<void> cancelNotification(int id) async {
    await _plugin.cancel(id);
  }

  /// Show an immediate local notification.
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

  /// Notify immediately when a new commentary item is fetched for a match.
  Future<int> notifyNewCommentary({
    required String matchTitle,
    required String commentary,
  }) async {
    return showInstantNotification(
      title: 'New commentary: $matchTitle',
      body: commentary,
    );
  }

  /// Cancel all scheduled notifications.
  Future<void> cancelAllNotifications() async {
    await _plugin.cancelAll();
  }
}
