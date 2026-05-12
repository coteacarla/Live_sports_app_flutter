import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/async_state_view.dart';
import '../../domain/entities/match.dart';
import '../../providers.dart';
import '../widgets/league_filter_bar.dart';
import '../widgets/match_card.dart';
import '../widgets/match_notification_toggle.dart';

class LiveMatchesScreen extends StatelessWidget {
  const LiveMatchesScreen({required this.onOpenMatch, super.key});

  final ValueChanged<Match> onOpenMatch;

  @override
  Widget build(BuildContext context) => _LiveMatchesView(onOpenMatch: onOpenMatch);
}

class _LiveMatchesView extends ConsumerWidget {
  const _LiveMatchesView({required this.onOpenMatch});

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
                child: const LeagueFilterBar(),
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
