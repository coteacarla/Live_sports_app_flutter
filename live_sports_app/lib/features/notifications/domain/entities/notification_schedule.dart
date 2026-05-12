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

  NotificationSchedule copyWith({
    String? id,
    String? matchId,
    String? matchTitle,
    NotificationType? type,
    DateTime? scheduledAt,
    Object? notificationId = _unset,
    bool? isActive,
  }) {
    return NotificationSchedule(
      id: id ?? this.id,
      matchId: matchId ?? this.matchId,
      matchTitle: matchTitle ?? this.matchTitle,
      type: type ?? this.type,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      notificationId: identical(notificationId, _unset)
          ? this.notificationId
          : notificationId as int?,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props =>
      [id, matchId, type, scheduledAt, notificationId, isActive];
}

const Object _unset = Object();
