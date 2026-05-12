import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/api_constants.dart';
import '../../providers.dart';
import '../../../sports/providers.dart';

class LeagueFilterBar extends ConsumerWidget {
  const LeagueFilterBar({this.onSelectLeague, super.key});

  final void Function(String? leagueId, String? leagueSportId)? onSelectLeague;

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
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sportsProvider);
    final selectedLeagueId = ref.watch(selectedLeagueIdProvider);

    // Filter leagues to only show whitelisted major leagues with available seasons
    final availableLeagues = state.leagues
        .where((league) =>
            _featuredLeagueNames.contains(league.name) &&
            league.currentSeason != null &&
            league.currentSeason!.isNotEmpty)
        .toList();

    // 1. Loading State
    if (state.isLoadingLeagues && availableLeagues.isEmpty) {
      return const SizedBox(
        height: 36,
        child: Align(
          alignment: Alignment.centerLeft,
          child: SizedBox.square(
            dimension: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      );
    }

    // 2. Error State
    if (state.leaguesErrorMessage != null && availableLeagues.isEmpty) {
      return const SizedBox.shrink();
    }

    // 3. Selection Helper
    void handleSelect(String? leagueId, [String? leagueSportId]) {
      if (onSelectLeague != null) {
        onSelectLeague!(leagueId, leagueSportId);
        return;
      }
      // Set sport FIRST: setSportId may reset selectedLeagueId internally, so
      // calling it after setLeagueId would wipe the selection just made.
      if (leagueSportId != null) {
        ref.read(selectedSportIdProvider.notifier).setSportId(leagueSportId);
      }
      ref.read(selectedLeagueIdProvider.notifier).setLeagueId(leagueId);
    }

    // 4. UI Rendering using ListView.builder
    return SizedBox(
      height: 40, // Required: Constrains the height of the horizontal ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // We add +1 to the count to account for the "All leagues" static chip
        itemCount: availableLeagues.length + 1, 
        itemBuilder: (context, index) {
          
          // Render the static "All leagues" chip at the very beginning
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                selected: selectedLeagueId == null,
                label: const Text('All leagues'),
                onSelected: (_) => handleSelect(null),
              ),
            );
          }

          // Because index 0 is taken, we subtract 1 to get the correct league
          final league = availableLeagues[index - 1];
          final slug = ApiConstants.leagueNameToEspnEndpointSlug[league.name];

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              selected: selectedLeagueId == (slug ?? league.name),
              label: Text(league.name),
              onSelected: (_) => handleSelect(slug ?? league.name, league.sportId),
            ),
          );
        },
      ),
    );
  }
}