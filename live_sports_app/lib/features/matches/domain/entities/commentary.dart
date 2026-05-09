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

  @override
  List<Object?> get props =>
      [id, matchId, minute, text, isKeyEvent, relatedEventId, publishedAt];
}