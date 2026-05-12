import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/async_state_view.dart';
import '../../domain/entities/commentary.dart';
import '../../domain/entities/match.dart';
import '../../providers.dart';
import '../../state.dart';
import '../widgets/match_notification_toggle.dart';

class MatchDetailScreen extends StatelessWidget {
  const MatchDetailScreen({required this.matchId, this.match, super.key});

  final String matchId;
  final Match? match;

  @override
  Widget build(BuildContext context) =>
      _MatchDetailView(matchId: matchId, initialMatch: match);
}

class _MatchDetailView extends ConsumerWidget {
  const _MatchDetailView({required this.matchId, this.initialMatch});

  final String matchId;
  final Match? initialMatch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = MatchDetailArgs(matchId: matchId, initialMatch: initialMatch);
    final state = ref.watch(matchDetailProvider(args));
    final commentary = ref.watch(matchCommentaryProvider(matchId));
    final notifier = ref.read(matchDetailProvider(args).notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Detail'),
        actions: [
          IconButton(
            onPressed: () => notifier.refresh(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: _buildBody(context, state, commentary, notifier),
    );
  }

  Widget _buildBody(
    BuildContext context,
    MatchDetailState state,
    AsyncValue<List<Commentary>> commentary,
    MatchDetail notifier,
  ) {
    final commentaryItems = commentary.value ?? const <Commentary>[];

    if (commentary.isLoading && commentaryItems.isEmpty) {
      return const Center(
        child: AsyncStateView.loading(message: 'Loading match detail...'),
      );
    }

    if (state.errorMessage != null && commentaryItems.isEmpty) {
      return Center(
        child: AsyncStateView.error(
          title: 'Failed to load match detail',
          message: state.errorMessage!,
          onRetry: () => notifier.refresh(),
        ),
      );
    }

    final spacing = (MediaQuery.of(context).size.height * 0.02).clamp(8.0, 28.0);
    final keyEvents = commentaryItems.where((c) => c.isKeyEvent).toList(growable: false);

    return ListView(
      padding: EdgeInsets.all(spacing),
      children: [
        _MatchHeader(match: state.match),
        SizedBox(height: spacing),

        // Key events — goals, cards, substitutions extracted from ESPN plays.
        _SectionTitle(title: 'Key Events'),
        SizedBox(height: spacing * 0.5),
        _KeyEventsList(items: keyEvents),
        SizedBox(height: spacing),

        // Full play-by-play commentary from the ESPN summary endpoint.
        _SectionTitle(title: 'Commentary'),
        SizedBox(height: spacing * 0.5),
        _CommentaryFeed(items: commentaryItems),
      ],
    );
  }
}

class _MatchHeader extends StatelessWidget {
  const _MatchHeader({required this.match});

  final Match match;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${match.homeTeam.name} vs ${match.awayTeam.name}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: (MediaQuery.of(context).size.height * 0.01).clamp(6.0, 16.0)),
        Row(
          children: [
            _ScoreBug(match: match),
            const Spacer(),
            MatchNotificationToggle(matchId: match.id),
          ],
        ),
      ],
    );
  }
}

class _ScoreBug extends StatelessWidget {
  const _ScoreBug({required this.match});

  final Match match;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final style = Theme.of(context).textTheme.titleMedium;
    final horiz = (mq.size.width * 0.02).clamp(8.0, 16.0);
    final vert = (mq.size.height * 0.005).clamp(4.0, 10.0);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horiz, vertical: vert),
        child: Text(match.scoreDisplay, style: style),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.titleLarge);
  }
}

/// Displays key events (goals, cards) extracted from the ESPN commentary feed.
class _KeyEventsList extends StatelessWidget {
  const _KeyEventsList({required this.items});

  final List<Commentary> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Text('No key events yet.');
    }

    final mq = MediaQuery.of(context);
    final radius = (mq.size.width * 0.035).clamp(12.0, 20.0);

    return Column(
      children: items
          .map(
            (item) => ListTile(
              dense: true,
              leading: CircleAvatar(
                radius: radius,
                child: Text("${item.minute}'", style: const TextStyle(fontSize: 10)),
              ),
              title: Text(item.text),
              trailing: const Icon(Icons.bolt),
            ),
          )
          .toList(growable: false),
    );
  }
}

/// Scrollable play-by-play feed from the ESPN summary endpoint.
class _CommentaryFeed extends StatelessWidget {
  const _CommentaryFeed({required this.items});

  final List<Commentary> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text('No commentary available yet.'));
    }

    final mq = MediaQuery.of(context);
    final iconSize = (mq.size.width * 0.035).clamp(12.0, 20.0);

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          dense: true,
          leading: Text("${item.minute}'"),
          title: Text(item.text),
          trailing: item.isKeyEvent
              ? Icon(Icons.bolt, size: iconSize)
              : const SizedBox.shrink(),
        );
      },
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemCount: items.length,
    );
  }
}
