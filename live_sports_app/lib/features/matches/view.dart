import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/async_state_view.dart';
import 'domain/entities/match.dart';
import 'domain/entities/match_event.dart';
import 'domain/entities/commentary.dart';
import 'presentation/widgets/league_filter_bar.dart';
import 'presentation/widgets/match_card.dart';
import 'presentation/widgets/match_notification_toggle.dart';
import 'providers.dart';
import 'state.dart';

// ─────────────────────────────────────────────────────────────────────────
// LIVE MATCHES SCREEN & VIEW
// ─────────────────────────────────────────────────────────────────────────

/// Main entry point for Live Matches, used in navigation.
class LiveMatchesScreen extends StatelessWidget {
  const LiveMatchesScreen({required this.onOpenMatch, super.key});

  final ValueChanged<Match> onOpenMatch;

  @override
  Widget build(BuildContext context) => LiveMatchesView(onOpenMatch: onOpenMatch);
}

/// Displays current live matches with filtering by league and sport.
class LiveMatchesView extends ConsumerWidget {
  const LiveMatchesView({required this.onOpenMatch, super.key});

  final ValueChanged<Match> onOpenMatch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(liveMatchesProvider);
    final notifier = ref.read(liveMatchesProvider.notifier);

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => notifier.refresh(),
        child: _buildBody(context, state, ref),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    LiveMatchesState state,
    WidgetRef ref,
  ) {
    final notifier = ref.read(liveMatchesProvider.notifier);
    final children = <Widget>[
      GestureDetector(
        onTap: () {}, // Placeholder for league filter bar interaction
        child: LeagueFilterBar(
          onSelectLeague: (id) {
            // Update the state provider, which will trigger the listener to sync with notifier
            ref.read(selectedLeagueIdProvider.notifier).state = id;
          },
        ),
      ),
      const SizedBox(height: 12),
    ];

    if (state.isLoading && state.matches.isEmpty) {
      children.add(
        const Padding(
          padding: EdgeInsets.only(top: 100),
          child: AsyncStateView.loading(message: 'Fetching live matches...'),
        ),
      );
    } else if (state.matches.isEmpty && state.errorMessage != null) {
      children.add(
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: AsyncStateView.error(
            title: 'Could not load live matches',
            message: state.errorMessage!,
            onRetry: () => notifier.refresh(),
          ),
        ),
      );
    } else if (state.matches.isEmpty) {
      children.add(
        const Padding(
          padding: EdgeInsets.only(top: 96),
          child: AsyncStateView.empty(
            title: 'No live matches right now',
            message: 'Try another league, refresh, or switch sport from Sports.',
          ),
        ),
      );
    } else {
      if (state.errorMessage != null) {
        children.add(_buildInlineError(context, state.errorMessage!));
      }
      children.addAll(_buildMatchCards(state.matches));
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: children,
    );
  }

  Widget _buildInlineError(BuildContext context, String message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        message,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }

  List<Widget> _buildMatchCards(List<Match> matches) {
    return matches.map((match) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: MatchCard(
          match: match,
          onTap: () => onOpenMatch(match),
          trailing: MatchNotificationToggle(matchId: match.id),
        ),
      );
    }).toList(growable: false);
  }
}

// ─────────────────────────────────────────────────────────────────────────
// RESULTS SCREEN & VIEW (Scheduled + Past Matches)
// ─────────────────────────────────────────────────────────────────────────

/// Entry point for Results view in navigation.
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({required this.onOpenMatch, super.key});

  final ValueChanged<Match> onOpenMatch;

  @override
  Widget build(BuildContext context) => ResultsView(onOpenMatch: onOpenMatch);
}

/// Shows upcoming fixtures and recent match results.
class ResultsView extends ConsumerWidget {
  const ResultsView({required this.onOpenMatch, super.key});

  final ValueChanged<Match> onOpenMatch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(resultsProvider);
    final notifier = ref.read(resultsProvider.notifier);

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => notifier.refresh(),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            LeagueFilterBar(
              onSelectLeague: (id) {
                notifier.selectLeague(id);
              },
            ),
            const SizedBox(height: 16),
            ..._buildSection(
              context,
              title: 'Upcoming',
              matches: state.scheduledMatches,
              isLoading: state.isLoading,
              errorMessage: state.scheduledErrorMessage,
              onOpenMatch: onOpenMatch,
              onRetry: () => notifier.refresh(),
              emptyMessage: 'No upcoming fixtures found.',
            ),
            const SizedBox(height: 20),
            ..._buildSection(
              context,
              title: 'Recent Results',
              matches: state.pastMatches,
              isLoading: state.isLoading,
              errorMessage: state.pastErrorMessage,
              onOpenMatch: onOpenMatch,
              onRetry: () => notifier.refresh(),
              emptyMessage: 'No recent results available.',
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSection(
    BuildContext context, {
    required String title,
    required List<Match> matches,
    required bool isLoading,
    required String? errorMessage,
    required ValueChanged<Match> onOpenMatch,
    required VoidCallback onRetry,
    required String emptyMessage,
  }) {
    return [
      Text(title, style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 8),
      _SectionMatches(
        matches: matches,
        isLoading: isLoading,
        errorMessage: errorMessage,
        onOpenMatch: onOpenMatch,
        onRetry: onRetry,
        emptyMessage: emptyMessage,
      ),
    ];
  }
}

class _SectionMatches extends StatelessWidget {
  const _SectionMatches({
    required this.matches,
    required this.isLoading,
    required this.errorMessage,
    required this.onOpenMatch,
    required this.onRetry,
    required this.emptyMessage,
  });

  final List<Match> matches;
  final bool isLoading;
  final String? errorMessage;
  final ValueChanged<Match> onOpenMatch;
  final VoidCallback onRetry;
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    if (isLoading && matches.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: AsyncStateView.loading(message: 'Loading timeline...'),
      );
    }

    if (errorMessage != null && matches.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: AsyncStateView.error(
          title: 'Failed to load this section',
          message: errorMessage!,
          onRetry: onRetry,
        ),
      );
    }

    if (matches.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: AsyncStateView.empty(
          title: emptyMessage,
          message: 'Try another sport or refresh the timeline.',
        ),
      );
    }

    return Column(
      children: matches.take(8).map((match) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: MatchCard(
            match: match,
            onTap: () => onOpenMatch(match),
            trailing: MatchNotificationToggle(matchId: match.id),
          ),
        );
      }).toList(growable: false),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// MATCH DETAIL SCREEN & VIEW
// ─────────────────────────────────────────────────────────────────────────

/// Entry point for Match Detail view in navigation.
class MatchDetailScreen extends StatelessWidget {
  const MatchDetailScreen({required this.matchId, this.match, super.key});

  final String matchId;
  final Match? match;

  @override
  Widget build(BuildContext context) {
    return MatchDetailView(matchId: matchId, initialMatch: match);
  }
}

/// Full-screen match detail with score, events, and live commentary.
class MatchDetailView extends ConsumerWidget {
  const MatchDetailView({required this.matchId, this.initialMatch, super.key});

  final String matchId;
  final Match? initialMatch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      matchDetailProvider(
        MatchDetailArgs(matchId: matchId, initialMatch: initialMatch),
      ),
    );
    final notifier = ref.read(
      matchDetailProvider(
        MatchDetailArgs(matchId: matchId, initialMatch: initialMatch),
      ).notifier,
    );

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
      body: _buildBody(context, state, ref),
    );
  }

  Widget _buildBody(
    BuildContext context,
    MatchDetailState state,
    WidgetRef ref,
  ) {
    final notifier = ref.read(
      matchDetailProvider(
        MatchDetailArgs(matchId: matchId, initialMatch: initialMatch),
      ).notifier,
    );
    if (state.isLoading && state.events.isEmpty && state.commentary.isEmpty) {
      return const Center(
        child: AsyncStateView.loading(message: 'Loading match detail...'),
      );
    }

    if (state.errorMessage != null && state.events.isEmpty) {
      return Center(
        child: AsyncStateView.error(
          title: 'Failed to load match detail',
          message: state.errorMessage!,
          onRetry: () => notifier.refresh(),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _MatchHeader(match: state.match),
        const SizedBox(height: 16),
        _SectionTitle(title: 'Events'),
        const SizedBox(height: 8),
        if (state.events.isEmpty)
          const Text('No events yet.')
        else
          ...state.events.map((event) => _MatchEventTile(event: event)),
        const SizedBox(height: 16),
        _SectionTitle(title: 'Commentary'),
        const SizedBox(height: 8),
        _CommentaryFeed(items: state.commentary),
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
        const SizedBox(height: 10),
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

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.titleLarge);
  }
}

// ─────────────────────────────────────────────────────────────────────────
// PRIVATE WIDGETS (Consolidated from separate files)
// ─────────────────────────────────────────────────────────────────────────

/// Simple display widget showing match score.
class _ScoreBug extends StatelessWidget {
  const _ScoreBug({required this.match});

  final Match match;

  @override
  Widget build(BuildContext context) {
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
}

/// List item for a single match event (goal, card, etc.).
class _MatchEventTile extends StatelessWidget {
  const _MatchEventTile({required this.event});

  final MatchEvent event;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: CircleAvatar(
        radius: 14,
        child: Text(event.minute.toString()),
      ),
      title: Text(event.playerName ?? 'Match Event'),
      subtitle: Text(event.detail ?? event.type.name),
      trailing: Text(event.minuteLabel),
    );
  }
}

/// Scrollable feed of match commentary with key event indicators.
class _CommentaryFeed extends StatelessWidget {
  const _CommentaryFeed({required this.items});

  final List<Commentary> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text('No commentary available yet.'));
    }

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
              ? const Icon(Icons.bolt, size: 16)
              : const SizedBox.shrink(),
        );
      },
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemCount: items.length,
    );
  }
}
