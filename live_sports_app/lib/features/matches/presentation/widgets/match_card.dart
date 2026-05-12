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
    final textTheme = Theme.of(context).textTheme;
    final mq = MediaQuery.of(context);
    final cardPadding = (mq.size.width * 0.03).clamp(10.0, 16.0);
    final rowGap = (mq.size.height * 0.01).clamp(6.0, 12.0);
    final scoreGap = (mq.size.width * 0.025).clamp(8.0, 14.0);

    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(cardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  if (trailing != null) trailing!,
                ],
              ),
              SizedBox(height: rowGap),
              Row(
                children: [
                  _buildScoreBug(context, match),
                  SizedBox(width: scoreGap),
                  Text(_statusLabel(match).toUpperCase()),
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
    final mq = MediaQuery.of(context);
    final style = Theme.of(context).textTheme.titleMedium;
    final horizontalPadding = (mq.size.width * 0.03).clamp(10.0, 16.0);
    final verticalPadding = (mq.size.height * 0.008).clamp(5.0, 10.0);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        child: Text(match.scoreDisplay, style: style),
      ),
    );
  }

  static String _formatKickoff(DateTime value) {
    final local = value.toLocal();
    String pad(int n) => n.toString().padLeft(2, '0');

    return '${pad(local.day)}/${pad(local.month)} ${pad(local.hour)}:${pad(local.minute)}';
  }
}

  String _statusLabel(Match match) {
    if (match.isFinished) return 'FT';
    if (match.isLive) return 'LIVE';
    return match.status.name;
  }