#!/bin/bash

# Create the folder tree report
cat > /tmp/tree_output.txt << 'TREE'
COMPLETE FOLDER TREE FOR: live_sports_app/lib/

live_sports_app/lib/
├── app.dart
├── main.dart
├── core/
│   ├── result.dart
│   ├── constants/
│   │   ├── api_constants.dart
│   │   └── polling_config.dart
│   ├── error/
│   │   └── failures.dart
│   ├── network/
│   │   ├── dio_client.dart
│   │   └── network_info.dart
│   ├── notifications/
│   │   ├── local_notification_service.dart
│   │   └── match_notification_preferences.dart
│   ├── storage/
│   │   ├── hive_service.dart
│   │   └── storage_keys.dart
│   └── widgets/
│       └── async_state_view.dart
├── features/
│   ├── matches/
│   │   ├── providers.dart
│   │   ├── providers.g.dart (generated)
│   │   ├── state.dart
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── matches_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   ├── match_model.dart
│   │   │   │   ├── match_model.freezed.dart (generated)
│   │   │   │   ├── team_model.dart
│   │   │   │   ├── team_model.freezed.dart (generated)
│   │   │   │   ├── team_model.g.dart (generated)
│   │   │   │   ├── match_event_commentary.dart
│   │   │   │   ├── match_event_commentary.freezed.dart (generated)
│   │   │   │   ├── match_event_commentary.g.dart (generated)
│   │   │   │   └── espn/
│   │   │   │       ├── espn_models.dart
│   │   │   │       ├── espn_models.freezed.dart (generated)
│   │   │   │       └── espn_models.g.dart (generated)
│   │   │   └── repositories/
│   │   │       └── matches_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── match.dart
│   │   │   │   ├── team.dart
│   │   │   │   ├── commentary.dart
│   │   │   │   └── match_event.dart
│   │   │   ├── repositories/
│   │   │   │   └── matches_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_live_matches.dart
│   │   │       ├── get_past_matches.dart
│   │   │       ├── get_scheduled_matches.dart
│   │   │       └── get_match_commentary.dart
│   │   └── presentation/
│   │       ├── screens/
│   │       │   ├── live_matches_screen.dart
│   │       │   ├── match_detail_screen.dart
│   │       │   └── results_screen.dart
│   │       └── widgets/
│   │           ├── league_filter_bar.dart
│   │           ├── match_card.dart
│   │           └── match_notification_toggle.dart
│   └── sports/
│       ├── providers.dart
│       ├── providers.g.dart (generated)
│       ├── state.dart
│       ├── data/
│       │   ├── datasources/
│       │   │   └── sports_remote_datasource.dart
│       │   ├── models/
│       │   │   ├── league_model.dart
│       │   │   └── sport_model.dart
│       │   └── repositories/
│       │       └── sports_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   ├── league.dart
│       │   │   └── sport.dart
│       │   ├── repositories/
│       │   │   └── sports_repository.dart
│       │   └── usecases/
│       │       ├── get_sports.dart
│       │       └── get_leagues_by_sport.dart
│       └── presentation/
│           ├── screens/
│           │   └── sports_screen.dart
│           └── widgets/
│               ├── league_list_item.dart
│               └── sport_category_tile.dart
└── injection/
    └── providers.dart

TOTAL FILES: 60 Dart files (excluding generated ones)
TREE

cat /tmp/tree_output.txt

# Now check each one individually with explicit searches
echo ""
echo "=========================================="
echo "COMPREHENSIVE IMPORT ANALYSIS"
echo "=========================================="
echo ""

unused=()

# Check each non-entry-point, non-generated file
source_files=(
  "core/result.dart:Result"
  "core/constants/api_constants.dart:ApiConstants"
  "core/constants/polling_config.dart:polling"
  "core/error/failures.dart:Failure"
  "core/network/dio_client.dart:DioClient"
  "core/network/network_info.dart:NetworkInfo"
  "core/notifications/local_notification_service.dart:LocalNotificationService"
  "core/notifications/match_notification_preferences.dart:MatchNotificationPreferences"
  "core/storage/hive_service.dart:HiveService"
  "core/storage/storage_keys.dart:StorageKeys"
  "core/widgets/async_state_view.dart:AsyncStateView"
)

for file_with_class in "${source_files[@]}"; do
  IFS=':' read -r file class <<< "$file_with_class"
  
  # Try to find imports
  count=$(grep -r "import.*$file" live_sports_app/lib --include="*.dart" 2>/dev/null | wc -l)
  
  # Also check for usage of class names to be sure
  class_count=$(grep -r "\b$class\b" live_sports_app/lib --include="*.dart" 2>/dev/null | wc -l)
  
  if [ $count -eq 0 ] && [ $class_count -lt 2 ]; then
    echo "POSSIBLE UNUSED: live_sports_app/lib/$file (imports:$count, class refs:$class_count)"
  else
    echo "OK: live_sports_app/lib/$file (imports:$count, class refs:$class_count)"
  fi
done

