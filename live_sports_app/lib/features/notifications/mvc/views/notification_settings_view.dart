import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../injection/providers.dart';

class NotificationSettingsView extends ConsumerWidget {
  const NotificationSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsEnabled = ref.watch(notificationsEnabledProvider);
    final mq = MediaQuery.of(context);
    final sectionGap = (mq.size.height * 0.02).clamp(12.0, 20.0);
    final bodyGap = (mq.size.height * 0.015).clamp(8.0, 16.0);

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        children: [
          SizedBox(height: sectionGap),
          SwitchListTile(
            title: const Text('Enable Notifications'),
            subtitle: const Text('Receive instant alerts from live matches'),
            value: notificationsEnabled,
            onChanged: (value) => ref.read(notificationsEnabledProvider.notifier).setEnabled(value),
          ),
          SizedBox(height: sectionGap),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: (mq.size.width * 0.04).clamp(16.0, 24.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How Notifications Work',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: bodyGap),
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