import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/async_state_view.dart';
import '../matches/providers.dart';
import 'domain/entities/league.dart';
import 'domain/entities/sport.dart';
import 'presentation/widgets/league_list_item.dart';
import 'presentation/widgets/sport_category_tile.dart';
import 'providers.dart';

// ─────────────────────────────────────────────────────────────────────────
// SPORTS SCREEN
// ─────────────────────────────────────────────────────────────────────────

/// Entry point for Sports view in navigation.
class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) => const SportsView();
}

// ─────────────────────────────────────────────────────────────────────────
// SPORTS VIEW
// ─────────────────────────────────────────────────────────────────────────

/// Displays available sports and leagues for the selected sport.
/// Used to filter matches in the Matches feature.
class SportsView extends ConsumerWidget {
  const SportsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sportsProvider);
    final notifier = ref.read(sportsProvider.notifier);

    // Note: selectedSportIdProvider is defined in matches/providers.dart
    // and synced here for filtering across features
    final selectedSportId = ref.watch(selectedSportIdProvider);

    // Sync external sport selection changes to the sports notifier
    ref.listen<String>(selectedSportIdProvider, (prev, next) {
      // Only sync if this is an actual change (not the initial build)
      if (prev != null && prev != next && next != notifier.selectedSportId) {
        notifier.selectSport(next);
      }
    });

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => notifier.refresh(),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Sports', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 12),
            _SportsSection(
              sports: state.sports,
              isLoading: state.isLoadingSports,
              errorMessage: state.sportsErrorMessage,
              selectedSportId: selectedSportId,
              onSelectSport: (sport) {
                // Only update the global state provider - the listener will sync to notifier
                ref.read(selectedSportIdProvider.notifier).state = sport.slug;
                ref.read(selectedLeagueIdProvider.notifier).state = null;
              },
              onRetry: () => notifier.refresh(),
            ),
            const SizedBox(height: 20),
            Text('Leagues', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            _LeaguesSection(
              isLoading: state.isLoadingLeagues,
              errorMessage: state.leaguesErrorMessage,
              leagues: state.leagues,
              onRetry: () => notifier.refresh(),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// PRIVATE WIDGETS
// ─────────────────────────────────────────────────────────────────────────

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
      return const SizedBox(
        height: 100,
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

    return SizedBox(
      height: 100,
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

  @override
  Widget build(BuildContext context) {
    if (isLoading && leagues.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: AsyncStateView.loading(message: 'Loading leagues...'),
      );
    }

    if (errorMessage != null && leagues.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: AsyncStateView.error(
          title: 'Failed to load leagues',
          message: errorMessage!,
          onRetry: onRetry,
        ),
      );
    }

    if (leagues.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Text('No leagues found for this sport.'),
      );
    }

    return Column(
      children: leagues
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
