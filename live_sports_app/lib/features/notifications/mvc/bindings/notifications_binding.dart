import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/notifications_controller.dart';

final notificationsControllerProvider = Provider<NotificationsController>((ref) {
  return NotificationsController();
});
