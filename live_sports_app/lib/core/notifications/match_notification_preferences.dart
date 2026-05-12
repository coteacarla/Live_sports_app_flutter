import 'package:riverpod/riverpod.dart';

class MatchNotificationPreferences extends Notifier<Set<String>> {
  @override
  Set<String> build() => <String>{};

  bool isEnabled(String matchId) => state.contains(matchId);

  void setEnabled(String matchId, bool enabled) {
    final updated = Set<String>.from(state);
    final changed = enabled ? updated.add(matchId) : updated.remove(matchId);
    if (changed) {
      state = updated;
    }
  }

  void toggle(String matchId) {
    setEnabled(matchId, !isEnabled(matchId));
  }
}