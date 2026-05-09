import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers.dart';
import '../../../sports/providers.dart';

class LeagueFilterBar extends ConsumerWidget {
  const LeagueFilterBar({this.onSelectLeague, super.key});

  final ValueChanged<String?>? onSelectLeague;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sportsProvider);
    final selectedLeagueId = ref.watch(selectedLeagueIdProvider);

    // 1. Loading State
    if (state.isLoadingLeagues && state.leagues.isEmpty) {
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
    if (state.leaguesErrorMessage != null && state.leagues.isEmpty) {
      return const SizedBox.shrink();
    }

    // 3. Selection Helper
    void handleSelect(String? leagueId) {
      if (onSelectLeague != null) {
        onSelectLeague!(leagueId);
      } else {
        ref.read(selectedLeagueIdProvider.notifier).state = leagueId;
      }
    }

    // 4. UI Rendering using ListView.builder
    return SizedBox(
      height: 40, // Required: Constrains the height of the horizontal ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // We add +1 to the count to account for the "All leagues" static chip
        itemCount: state.leagues.length + 1, 
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
          final league = state.leagues[index - 1];

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              selected: selectedLeagueId == league.name,
              label: Text(league.name),
              onSelected: (_) => handleSelect(league.name),
            ),
          );
        },
      ),
    );
  }
}