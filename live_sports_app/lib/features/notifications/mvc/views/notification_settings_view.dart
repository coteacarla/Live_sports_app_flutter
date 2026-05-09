import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../injection/providers.dart';

class NotificationSettingsView extends ConsumerWidget {
  const NotificationSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsEnabled = ref.watch(notificationsEnabledProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      // 1. Swapped Column for ListView to prevent future screen overflow errors
      body: ListView(
        children: [
          const SizedBox(height: 16),
          
          // 2. SwitchListTile handles its own edge padding natively
          SwitchListTile(
            title: const Text('Enable Notifications'),
            subtitle: const Text('Receive instant alerts from live matches'),
            value: notificationsEnabled,
            // 3. Simplified the onChanged callback to a single line
            onChanged: (value) => ref.read(notificationsEnabledProvider.notifier).state = value,
          ),
          
          const SizedBox(height: 16),
          
          // 4. We only apply padding to the text section now
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How Notifications Work',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Instant notifications are sent when:\n\n'
                  '• A match you\'re watching goes live\n'
                  '• A match you\'re watching finishes\n'
                  '• New key commentary is fetched\n\n'
                  'Notifications appear automatically based on live match data, '
                  'not scheduled times.',
                  style: TextStyle(fontSize: 14, height: 1.6),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}