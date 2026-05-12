class NotificationsController {
  // Simplified to just handle instant notifications.
  // Start/end/commentary notifications are sent directly from polling controllers.

  Future<void> sendLiveUpdateNotification({
    required String title,
    required String body,
  }) {
    // Notifications are already being sent by match detail and live matches controllers.
    // This method is kept for potential UI-triggered notifications.
    return Future.value();
  }
}

