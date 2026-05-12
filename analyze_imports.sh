#!/bin/bash

# Check each file for being imported
check_file() {
  local file=$1
  local basename=$(basename "$file" .dart)
  local dirname=$(dirname "$file")
  local relative_path="${file#live_sports_app/lib/}"
  
  # Count how many times this file is imported (excluding its own imports)
  local count=$(grep -r "import.*$relative_path" live_sports_app/lib --include="*.dart" | wc -l)
  
  if [ $count -eq 0 ]; then
    echo "UNUSED: $file"
  fi
}

# Check main entry points first
echo "=== Checking entry points ==="
check_file "live_sports_app/lib/main.dart"
check_file "live_sports_app/lib/app.dart"

echo ""
echo "=== Checking core utilities ==="
check_file "live_sports_app/lib/core/result.dart"
check_file "live_sports_app/lib/core/storage/storage_keys.dart"
check_file "live_sports_app/lib/features/matches/domain/entities/match_event.dart"

