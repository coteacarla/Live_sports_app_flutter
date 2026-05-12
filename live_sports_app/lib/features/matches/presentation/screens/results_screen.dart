import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/async_state_view.dart';
import '../../domain/entities/match.dart';
import '../../providers.dart';
import '../widgets/league_filter_bar.dart';
import '../widgets/match_card.dart';
import '../widgets/match_notification_toggle.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({required this.onOpenMatch, super.key});

  final ValueChanged<Match> onOpenMatch;

  @override
  Widget build(BuildContext context) => _ResultsView(onOpenMatch: onOpenMatch);
}

class _ResultsView extends ConsumerWidget {
  const _ResultsView({required this.onOpenMatch});

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
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              sliver: SliverToBoxAdapter(
                child: const LeagueFilterBar(),
              ),
            ),

            // ── Date navigator ───────────────────────────────────────────────
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              sliver: SliverToBoxAdapter(child: _DateNavigator()),
            ),

            // ── Upcoming section ─────────────────────────────────────────────
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              sliver: SliverToBoxAdapter(
                child: Text('Upcoming', style: Theme.of(context).textTheme.titleLarge),
              ),
            ),
            if (state.isLoading && state.scheduledMatches.isEmpty)
              const SliverToBoxAdapter(
                child: AsyncStateView.loading(message: 'Loading upcoming...'),
              )
            else if (state.scheduledMatches.isEmpty && state.scheduledErrorMessage != null)
              SliverToBoxAdapter(
                child: AsyncStateView.error(
                  title: 'Failed to load upcoming',
                  message: state.scheduledErrorMessage!,
                  onRetry: () => notifier.refresh(),
                ),
              )
            else if (state.scheduledMatches.isEmpty)
              const SliverToBoxAdapter(
                child: AsyncStateView.empty(
                  title: 'No upcoming fixtures',
                  message: 'Try a different date or league.',
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final match = state.scheduledMatches[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: MatchCard(
                          match: match,
                          onTap: () => onOpenMatch(match),
                          trailing: MatchNotificationToggle(matchId: match.id),
                        ),
                      );
                    },
                    childCount: state.scheduledMatches.length,
                  ),
                ),
              ),

            // ── Recent Results section ───────────────────────────────────────
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              sliver: SliverToBoxAdapter(
                child: Text('Recent Results', style: Theme.of(context).textTheme.titleLarge),
              ),
            ),
            if (state.isLoading && state.pastMatches.isEmpty)
              const SliverToBoxAdapter(
                child: AsyncStateView.loading(message: 'Loading results...'),
              )
            else if (state.pastMatches.isEmpty && state.pastErrorMessage != null)
              SliverToBoxAdapter(
                child: AsyncStateView.error(
                  title: 'Failed to load results',
                  message: state.pastErrorMessage!,
                  onRetry: () => notifier.refresh(),
                ),
              )
            else if (state.pastMatches.isEmpty)
              const SliverToBoxAdapter(
                child: AsyncStateView.empty(
                  title: 'No results',
                  message: 'Try a different date or league.',
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final match = state.pastMatches[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: MatchCard(
                          match: match,
                          onTap: () => onOpenMatch(match),
                          trailing: MatchNotificationToggle(matchId: match.id),
                        ),
                      );
                    },
                    childCount: state.pastMatches.length,
                  ),
                ),
              ),

            const SliverPadding(padding: EdgeInsets.only(bottom: 16)),
          ],
        ),
      ),
    );
  }
}

class _DateNavigator extends ConsumerWidget {
  const _DateNavigator();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(selectedDateProvider);
    final now = DateTime.now();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          tooltip: 'Previous day',
          onPressed: () => ref.read(selectedDateProvider.notifier).goBack(),
        ),
        TextButton(
          onPressed: () => ref.read(selectedDateProvider.notifier).setDate(now),
          child: Text(
            _label(date, now),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          tooltip: 'Next day',
          onPressed: () => ref.read(selectedDateProvider.notifier).goForward(),
        ),
      ],
    );
  }

  String _label(DateTime date, DateTime now) {
    if (_sameDay(date, now)) return 'Today';
    if (_sameDay(date, now.subtract(const Duration(days: 1)))) return 'Yesterday';
    if (_sameDay(date, now.add(const Duration(days: 1)))) return 'Tomorrow';
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
