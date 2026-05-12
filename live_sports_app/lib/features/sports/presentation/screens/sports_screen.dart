import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/async_state_view.dart';
import '../../../matches/providers.dart';
import '../../domain/entities/league.dart';
import '../../domain/entities/sport.dart';
import '../../providers.dart';
import '../widgets/league_list_item.dart';
import '../widgets/sport_category_tile.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) => const _SportsView();
}

class _SportsView extends ConsumerWidget {
  const _SportsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sportsProvider);
    final notifier = ref.read(sportsProvider.notifier);
    final selectedSportId = ref.watch(selectedSportIdProvider);

    final mq = MediaQuery.of(context);
    final spacing = (mq.size.height * 0.02).clamp(8.0, 28.0);
    final spacingSmall = (spacing * 0.6).clamp(6.0, 16.0);
    final sportsSectionHeight = (mq.size.height * 0.16).clamp(88.0, 144.0);

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => notifier.refresh(),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Text('Sports', style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(height: spacingSmall),
                  SizedBox(
                    height: sportsSectionHeight,
                    child: _SportsSection(
                      sports: state.sports,
                      isLoading: state.isLoadingSports,
                      errorMessage: state.sportsErrorMessage,
                      selectedSportId: selectedSportId,
                      onSelectSport: (sport) {
                        ref.read(selectedSportIdProvider.notifier).setSportId(sport.slug);
                        ref.read(selectedLeagueIdProvider.notifier).setLeagueId(null);
                      },
                      onRetry: () => notifier.refresh(),
                    ),
                  ),
                  SizedBox(height: spacing),
                  Text('Leagues', style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: spacingSmall),
                ]),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: _LeaguesSection(
                  isLoading: state.isLoadingLeagues,
                  errorMessage: state.leaguesErrorMessage,
                  leagues: state.leagues,
                  onRetry: () => notifier.refresh(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SportsSection extends StatelessWidget {
  const _SportsSection({
    required this.sports,
    required this.isLoading,
    required this.errorMessage,
    required this.selectedSportId,
    required this.onSelectSport,
    required this.onRetry,
  });

  final List<Sport> sports;
  final bool isLoading;
  final String? errorMessage;
  final String? selectedSportId;
  final ValueChanged<Sport> onSelectSport;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    if (isLoading && sports.isEmpty) {
      return SizedBox(
        height: (MediaQuery.of(context).size.height * 0.12).clamp(88.0, 132.0),
        child: AsyncStateView.loading(message: 'Loading sports...'),
      );
    }

    if (errorMessage != null && sports.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: AsyncStateView.error(
          title: 'Failed to load sports',
          message: errorMessage!,
          onRetry: onRetry,
        ),
      );
    }

    if (sports.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Text('No sports available right now.'),
      );
    }

    final rowHeight = (MediaQuery.of(context).size.height * 0.12).clamp(88.0, 132.0);

    return SizedBox(
      height: rowHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final sport = sports[index];
          final isSelected = selectedSportId == null
              ? index == 0
              : sport.slug == selectedSportId;
          return SportCategoryTile(
            sport: sport,
            isSelected: isSelected,
            onTap: () => onSelectSport(sport),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemCount: sports.length,
      ),
    );
  }
}

class _LeaguesSection extends StatelessWidget {
  const _LeaguesSection({
    required this.isLoading,
    required this.errorMessage,
    required this.leagues,
    required this.onRetry,
  });

  final bool isLoading;
  final String? errorMessage;
  final List<League> leagues;
  final VoidCallback onRetry;

  // Whitelist of major leagues to display
  static const Set<String> _featuredLeagueNames = {
    // Football
    'Premier League',
    'La Liga',
    'Serie A',
    'Serie A TIM',
    'Bundesliga',
    'Ligue 1',
    'Championship',
    'Scottish Premier League',
    'Scottish Championship',
    'Eredivisie',
    'Primeira Liga',
    'Liga Portugal Bwin',
    'Super Lig',
    'Süper Lig',
    // Basketball
    'NBA',
    'WNBA',
    "NCAA Men's Basketball",
    "NCAA Women's Basketball",
    // Volleyball
    "NCAA Women's Volleyball",
    "NCAA Men's Volleyball",
    // Hockey
    'NHL',
    "NCAA Men's Hockey",
    "NCAA Women's Hockey",
  };

  @override
  Widget build(BuildContext context) {
    // Filter to only show whitelisted leagues
    final filteredLeagues = leagues
        .where((league) => _featuredLeagueNames.contains(league.name))
        .toList();

    if (isLoading && filteredLeagues.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: AsyncStateView.loading(message: 'Loading leagues...'),
      );
    }

    if (errorMessage != null && filteredLeagues.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: AsyncStateView.error(
          title: 'Failed to load leagues',
          message: errorMessage!,
          onRetry: onRetry,
        ),
      );
    }

    if (filteredLeagues.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Text('No featured leagues found for this sport.'),
      );
    }

    return Column(
      children: filteredLeagues
          .map(
            (league) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: LeagueListItem(league: league),
            ),
          )
          .toList(growable: false),
    );
  }
}
