import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../injection/providers.dart';

class MatchNotificationToggle extends ConsumerWidget {
  const MatchNotificationToggle({required this.matchId, super.key});

  final String matchId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(matchNotificationPreferencesProvider);
    final isEnabled = prefs.isEnabled(matchId);

    return IconButton(
      tooltip: isEnabled ? 'Disable match notifications' : 'Enable match notifications',
      onPressed: () => ref.read(matchNotificationPreferencesProvider).toggle(matchId),
      icon: Icon(
        isEnabled ? Icons.notifications_active_outlined : Icons.notifications_off_outlined,
      ),
    );
  }
}