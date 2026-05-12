#!/bin/bash

# Create a list of all Dart files to check (excluding generated files like .freezed, .g)
declare -a files_to_check=(
  "app.dart"
  "main.dart"
  "core/result.dart"
  "core/constants/api_constants.dart"
  "core/constants/polling_config.dart"
  "core/error/failures.dart"
  "core/network/dio_client.dart"
  "core/network/network_info.dart"
  "core/notifications/local_notification_service.dart"
  "core/notifications/match_notification_preferences.dart"
  "core/storage/hive_service.dart"
  "core/storage/storage_keys.dart"
  "core/widgets/async_state_view.dart"
  "features/matches/providers.dart"
  "features/matches/state.dart"
  "features/matches/data/datasources/matches_remote_datasource.dart"
  "features/matches/data/models/match_model.dart"
  "features/matches/data/models/team_model.dart"
  "features/matches/data/models/match_event_commentary.dart"
  "features/matches/data/models/espn/espn_models.dart"
  "features/matches/data/repositories/matches_repository_impl.dart"
  "features/matches/domain/entities/match.dart"
  "features/matches/domain/entities/team.dart"
  "features/matches/domain/entities/commentary.dart"
  "features/matches/domain/entities/match_event.dart"
  "features/matches/domain/repositories/matches_repository.dart"
  "features/matches/domain/usecases/get_live_matches.dart"
  "features/matches/domain/usecases/get_past_matches.dart"
  "features/matches/domain/usecases/get_scheduled_matches.dart"
  "features/matches/domain/usecases/get_match_commentary.dart"
  "features/matches/presentation/screens/live_matches_screen.dart"
  "features/matches/presentation/screens/match_detail_screen.dart"
  "features/matches/presentation/screens/results_screen.dart"
  "features/matches/presentation/widgets/league_filter_bar.dart"
  "features/matches/presentation/widgets/match_card.dart"
  "features/matches/presentation/widgets/match_notification_toggle.dart"
  "features/sports/providers.dart"
  "features/sports/state.dart"
  "features/sports/data/datasources/sports_remote_datasource.dart"
  "features/sports/data/models/league_model.dart"
  "features/sports/data/models/sport_model.dart"
  "features/sports/data/repositories/sports_repository_impl.dart"
  "features/sports/domain/entities/league.dart"
  "features/sports/domain/entities/sport.dart"
  "features/sports/domain/repositories/sports_repository.dart"
  "features/sports/domain/usecases/get_sports.dart"
  "features/sports/domain/usecases/get_leagues_by_sport.dart"
  "features/sports/presentation/screens/sports_screen.dart"
  "features/sports/presentation/widgets/league_list_item.dart"
  "features/sports/presentation/widgets/sport_category_tile.dart"
  "injection/providers.dart"
)

unused_list=()
entry_points=("main.dart" "app.dart")

for file in "${files_to_check[@]}"; do
  full_path="live_sports_app/lib/$file"
  base_name=$(basename "$file" .dart)
  
  # Check if it's an entry point
  is_entry_point=0
  for ep in "${entry_points[@]}"; do
    if [ "$file" = "$ep" ]; then
      is_entry_point=1
      break
    fi
  done
  
  # Skip entry points
  if [ $is_entry_point -eq 1 ]; then
    continue
  fi
  
  # Search for imports of this file
  # Look for multiple patterns:
  # 1. import 'path/to/file.dart'
  # 2. import '.../file.dart'
  # 3. import '../file.dart' etc.
  
  # Count all grep results for this file import
  import_count=$(grep -r "import.*$file" live_sports_app/lib --include="*.dart" | wc -l)
  
  if [ $import_count -eq 0 ]; then
    unused_list+=("$file")
  fi
done

if [ ${#unused_list[@]} -eq 0 ]; then
  echo "No unused files detected!"
else
  echo "Files with NO importers:"
  for f in "${unused_list[@]}"; do
    echo "  live_sports_app/lib/$f"
  done
  echo ""
  echo "Count: ${#unused_list[@]}"
fi
