#!/bin/bash

# Extract just the file paths being imported
echo "Extracting all imported files..."
grep -rh "^import ['\"].*\.dart" live_sports_app/lib --include="*.dart" | \
  sed "s/^import ['\"]//; s/['\"].*//; s/^.*\/lib\///" | \
  grep -v "^package:" | grep -v "^dart:" | sort | uniq > /tmp/imported_paths.txt

echo "=== All imported internal files ==="
cat /tmp/imported_paths.txt

# List all source files (excluding generated)
echo ""
echo "=== Checking coverage ==="
source_files=(
  "app.dart"
  "core/constants/api_constants.dart"
  "core/constants/polling_config.dart"
  "core/error/failures.dart"
  "core/network/dio_client.dart"
  "core/network/network_info.dart"
  "core/notifications/local_notification_service.dart"
  "core/notifications/match_notification_preferences.dart"
  "core/result.dart"
  "core/storage/hive_service.dart"
  "core/storage/storage_keys.dart"
  "core/widgets/async_state_view.dart"
  "features/matches/data/datasources/matches_remote_datasource.dart"
  "features/matches/data/models/espn/espn_models.dart"
  "features/matches/data/models/match_event_commentary.dart"
  "features/matches/data/models/match_model.dart"
  "features/matches/data/models/team_model.dart"
  "features/matches/data/repositories/matches_repository_impl.dart"
  "features/matches/domain/entities/commentary.dart"
  "features/matches/domain/entities/match.dart"
  "features/matches/domain/entities/match_event.dart"
  "features/matches/domain/entities/team.dart"
  "features/matches/domain/repositories/matches_repository.dart"
  "features/matches/domain/usecases/get_live_matches.dart"
  "features/matches/domain/usecases/get_match_commentary.dart"
  "features/matches/domain/usecases/get_past_matches.dart"
  "features/matches/domain/usecases/get_scheduled_matches.dart"
  "features/matches/presentation/screens/live_matches_screen.dart"
  "features/matches/presentation/screens/match_detail_screen.dart"
  "features/matches/presentation/screens/results_screen.dart"
  "features/matches/presentation/widgets/league_filter_bar.dart"
  "features/matches/presentation/widgets/match_card.dart"
  "features/matches/presentation/widgets/match_notification_toggle.dart"
  "features/matches/providers.dart"
  "features/matches/state.dart"
  "features/sports/data/datasources/sports_remote_datasource.dart"
  "features/sports/data/models/league_model.dart"
  "features/sports/data/models/sport_model.dart"
  "features/sports/data/repositories/sports_repository_impl.dart"
  "features/sports/domain/entities/league.dart"
  "features/sports/domain/entities/sport.dart"
  "features/sports/domain/repositories/sports_repository.dart"
  "features/sports/domain/usecases/get_leagues_by_sport.dart"
  "features/sports/domain/usecases/get_sports.dart"
  "features/sports/presentation/screens/sports_screen.dart"
  "features/sports/presentation/widgets/league_list_item.dart"
  "features/sports/presentation/widgets/sport_category_tile.dart"
  "features/sports/providers.dart"
  "features/sports/state.dart"
  "injection/providers.dart"
  "main.dart"
)

echo "Files that appear to have NO importers:"
for file in "${source_files[@]}"; do
  if ! grep -q "^$file$" /tmp/imported_paths.txt; then
    # Special cases - entry points
    if [ "$file" != "main.dart" ] && [ "$file" != "app.dart" ]; then
      echo "  $file"
    fi
  fi
done

