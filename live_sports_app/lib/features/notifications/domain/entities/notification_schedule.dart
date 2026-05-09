import 'package:equatable/equatable.dart';

enum NotificationType {
  matchStarted,
  matchEnded,
  preMatchReminder,
  custom,
}

class NotificationSchedule extends Equatable {
  const NotificationSchedule({
    required this.id,
    required this.matchId,
    required this.matchTitle,
    required this.type,
    required this.scheduledAt,
    this.notificationId,
    this.isActive = true,
  });

  
  final String id;
  final String matchId;
  final String matchTitle;
  final NotificationType type;
  final DateTime scheduledAt;
  final int? notificationId;
  final bool isActive;

  @override
  List<Object?> get props => [id, matchId, type, scheduledAt, notificationId, isActive];
}
