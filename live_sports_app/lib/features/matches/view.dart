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
// LIVE MATCHES VIEW (screen moved to screens/)
// ─────────────────────────────────────────────────────────────────────────

/// Displays current live matches with filtering by league and sport.
class LiveMatchesView extends ConsumerWidget {
  const LiveMatchesView({required this.onOpenMatch, super.key});

  final ValueChanged<Match> onOpenMatch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(liveMatchesProvider);
    final notifier = ref.read(liveMatchesProvider.notifier);
    final mq = MediaQuery.of(context);
    final spacing = (mq.size.height * 0.02).clamp(8.0, 28.0);
    final spacingSmall = (spacing * 0.6).clamp(6.0, 16.0);

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => notifier.refresh(),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(spacingSmall),
              sliver: SliverToBoxAdapter(
                child: LeagueFilterBar(
                  onSelectLeague: (id) {
                    ref.read(selectedLeagueIdProvider.notifier).setLeagueId(id);
                  },
                ),
              ),
            ),

            if (state.isLoading && state.matches.isEmpty)
              SliverFillRemaining(
                child: AsyncStateView.loading(message: 'Fetching live matches...'),
              )
            else if (state.matches.isEmpty && state.errorMessage != null)
              SliverFillRemaining(
                child: AsyncStateView.error(
                  title: 'Could not load live matches',
                  message: state.errorMessage!,
                  onRetry: () => notifier.refresh(),
                ),
              )
            else if (state.matches.isEmpty)
              SliverFillRemaining(
                child: AsyncStateView.empty(
                  title: 'No matches scheduled for today',
                  message: 'Try another league, refresh, or switch sport from Sports.',
                ),
              )
            else ...[
              if (state.errorMessage != null)
                SliverToBoxAdapter(child: _buildInlineError(context, state.errorMessage!)),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: spacingSmall),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final match = state.matches[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: spacingSmall),
                        child: MatchCard(
                          match: match,
                          onTap: () => onOpenMatch(match),
                          trailing: MatchNotificationToggle(matchId: match.id),
                        ),
                      );
                    },
                    childCount: state.matches.length,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInlineError(BuildContext context, String message) {
    final mq = MediaQuery.of(context);
    final spacingSmall = (mq.size.height * 0.02 * 0.6).clamp(6.0, 16.0);

    return Padding(
      padding: EdgeInsets.only(bottom: spacingSmall),
      child: Text(
        message,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }

}

// ─────────────────────────────────────────────────────────────────────────
// RESULTS SCREEN & VIEW (Scheduled + Past Matches)
// ─────────────────────────────────────────────────────────────────────────

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
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: LeagueFilterBar(
                  onSelectLeague: (id) {
                    ref.read(selectedLeagueIdProvider.notifier).setLeagueId(id);
                  },
                ),
              ),
            ),

            // Upcoming section
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Text('Upcoming', style: Theme.of(context).textTheme.titleLarge),
              ),
            ),
            if (state.isLoading && state.scheduledMatches.isEmpty)
              const SliverToBoxAdapter(child: AsyncStateView.loading(message: 'Loading upcoming...'))
            else if (state.scheduledMatches.isEmpty && state.scheduledErrorMessage != null)
              SliverToBoxAdapter(child: AsyncStateView.error(title: 'Failed to load upcoming', message: state.scheduledErrorMessage!, onRetry: () => notifier.refresh()))
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final match = state.scheduledMatches[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: MatchCard(match: match, onTap: () => onOpenMatch(match), trailing: MatchNotificationToggle(matchId: match.id)),
                      );
                    },
                    childCount: state.scheduledMatches.length,
                  ),
                ),
              ),

            // Recent results section
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              sliver: SliverToBoxAdapter(
                child: Text('Recent Results', style: Theme.of(context).textTheme.titleLarge),
              ),
            ),
            if (state.isLoading && state.pastMatches.isEmpty)
              const SliverToBoxAdapter(child: AsyncStateView.loading(message: 'Loading results...'))
            else if (state.pastMatches.isEmpty && state.pastErrorMessage != null)
              SliverToBoxAdapter(child: AsyncStateView.error(title: 'Failed to load results', message: state.pastErrorMessage!, onRetry: () => notifier.refresh()))
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final match = state.pastMatches[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: MatchCard(match: match, onTap: () => onOpenMatch(match), trailing: MatchNotificationToggle(matchId: match.id)),
                      );
                    },
                    childCount: state.pastMatches.length,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
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
    final commentary = ref.watch(matchCommentaryProvider(matchId));
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
      body: _buildBody(context, state, commentary, ref),
    );
  }

  Widget _buildBody(
    BuildContext context,
    MatchDetailState state,
    AsyncValue<List<Commentary>> commentary,
    WidgetRef ref,
  ) {
    final notifier = ref.read(
      matchDetailProvider(
        MatchDetailArgs(matchId: matchId, initialMatch: initialMatch),
      ).notifier,
    );
    final commentaryItems = commentary.value ?? const <Commentary>[];

    if (commentary.isLoading && state.events.isEmpty && commentaryItems.isEmpty) {
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

    final spacing = (MediaQuery.of(context).size.height * 0.02).clamp(8.0, 28.0);

    return ListView(
      padding: EdgeInsets.all(spacing),
      children: [
        _MatchHeader(match: state.match),
        SizedBox(height: spacing),
        _SectionTitle(title: 'Events'),
        SizedBox(height: spacing * 0.5),
        if (state.events.isEmpty)
          const Text('No events yet.')
        else
          ...state.events.map((event) => _MatchEventTile(event: event)),
        SizedBox(height: spacing),
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

/// List item for a single match event (goal, card, etc.).
class _MatchEventTile extends StatelessWidget {
  const _MatchEventTile({required this.event});

  final MatchEvent event;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final radius = (mq.size.width * 0.035).clamp(12.0, 20.0);
    return ListTile(
      dense: true,
      leading: CircleAvatar(
        radius: radius,
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
