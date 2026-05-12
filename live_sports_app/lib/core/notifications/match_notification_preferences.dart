import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod/riverpod.dart';

import '../storage/hive_service.dart';
import '../storage/storage_keys.dart';

class MatchNotificationPreferences extends Notifier<Set<String>> {
  Box<dynamic>? _box;

  @override
  Set<String> build() {
    Future.microtask(_init);
    return <String>{};
  }

  Future<void> _init() async {
    if (!ref.mounted) return;
    try {
      _box = await HiveService.openBox(StorageKeys.followsBox);
      final followed = _box!.keys.whereType<String>().toSet();
      if (ref.mounted) state = followed;
    } catch (_) {
      // Hive unavailable — stay in-memory only.
    }
  }

  bool isEnabled(String matchId) => state.contains(matchId);

  void setEnabled(String matchId, bool enabled) {
    final updated = Set<String>.from(state);
    final changed = enabled ? updated.add(matchId) : updated.remove(matchId);
    if (!changed) return;
    state = updated;
    try {
      if (enabled) {
        _box?.put(matchId, true);
      } else {
        _box?.delete(matchId);
      }
    } catch (_) {}
  }

  void toggle(String matchId) => setEnabled(matchId, !isEnabled(matchId));
}
