import 'package:flutter/material.dart';

import '../../domain/entities/match.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({
    required this.match,
    this.onTap,
    this.trailing,
    super.key,
  });

  final Match match;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    // 1. Extract the text theme once to keep the build method clean
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: EdgeInsets.zero,
      // 2. Clip behavior ensures the InkWell ripple doesn't bleed outside the rounded corners
      clipBehavior: Clip.antiAlias, 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Teams & Trailing Widget
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${match.homeTeam.name} vs ${match.awayTeam.name}',
                      style: textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Cleaner syntax for conditionally adding a widget
                  if (trailing != null) trailing!, 
                ],
              ),
              const SizedBox(height: 8),
              
              // Bottom Row: Score, Status & Time
              Row(
                children: [
                  _buildScoreBug(context, match),
                  const SizedBox(width: 10),
                  Text(match.status.name.toUpperCase()),
                  const Spacer(),
                  Text(
                    _formatKickoff(match.scheduledAt),
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Inline score bug widget builder
  Widget _buildScoreBug(BuildContext context, Match match) {
    final style = Theme.of(context).textTheme.titleMedium;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(match.scoreDisplay, style: style),
      ),
    );
  }

  // 3. Simplified Date Formatter
  static String _formatKickoff(DateTime value) {
    final local = value.toLocal();
    // Helper function to pad single digits with a leading zero
    String pad(int n) => n.toString().padLeft(2, '0');
    
    return '${pad(local.day)}/${pad(local.month)} ${pad(local.hour)}:${pad(local.minute)}';
  }
}