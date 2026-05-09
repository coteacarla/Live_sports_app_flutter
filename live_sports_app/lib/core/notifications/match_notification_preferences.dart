import 'package:flutter/foundation.dart';

class MatchNotificationPreferences extends ChangeNotifier {
  final Set<String> _enabledMatchIds = <String>{};

  bool isEnabled(String matchId) => _enabledMatchIds.contains(matchId);

  void setEnabled(String matchId, bool enabled) {
    final changed = enabled
        ? _enabledMatchIds.add(matchId)
        : _enabledMatchIds.remove(matchId);
    if (changed) notifyListeners();
  }

  void toggle(String matchId) {
    setEnabled(matchId, !isEnabled(matchId));
  }
}