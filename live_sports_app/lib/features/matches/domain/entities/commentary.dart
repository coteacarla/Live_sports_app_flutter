import 'package:equatable/equatable.dart';

/// A single entry in the live text commentary feed for a match.
class Commentary extends Equatable {
  const Commentary({
    required this.id,
    required this.matchId,
    required this.minute,
    required this.text,
    this.isKeyEvent = false,
    this.relatedEventId,
    this.publishedAt,
  });

  final String id;
  final String matchId;

  /// The in-game minute this commentary belongs to.
  final int minute;

  /// The commentary text from the data provider.
  final String text;

  /// Whether this entry represents a major event (goal, card, etc.)
  /// so the UI can highlight or pin it in the feed.
  final bool isKeyEvent;

  /// Optional link to a [MatchEvent] that triggered this commentary entry.
  final String? relatedEventId;

  /// Wall-clock timestamp the entry was published.
  final DateTime? publishedAt;

  Commentary copyWith({
    String? id,
    String? matchId,
    int? minute,
    String? text,
    bool? isKeyEvent,
    Object? relatedEventId = _unset,
    Object? publishedAt = _unset,
  }) {
    return Commentary(
      id: id ?? this.id,
      matchId: matchId ?? this.matchId,
      minute: minute ?? this.minute,
      text: text ?? this.text,
      isKeyEvent: isKeyEvent ?? this.isKeyEvent,
      relatedEventId: identical(relatedEventId, _unset)
          ? this.relatedEventId
          : relatedEventId as String?,
      publishedAt: identical(publishedAt, _unset)
          ? this.publishedAt
          : publishedAt as DateTime?,
    );
  }

  @override
  List<Object?> get props =>
      [id, matchId, minute, text, isKeyEvent, relatedEventId, publishedAt];
}

const Object _unset = Object();
