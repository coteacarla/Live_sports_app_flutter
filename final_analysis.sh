#!/bin/bash

echo "=========================================="
echo "LIVE SPORTS APP - LIB FOLDER STRUCTURE"
echo "=========================================="
echo ""

# Get all dart files with full paths
all_dart_files=$(find live_sports_app/lib -name "*.dart" -type f | sort)

# Count them
count=$(echo "$all_dart_files" | wc -l)
echo "Total Dart files: $count"
echo ""

# Print folder tree structure
echo "FOLDER TREE:"
echo "live_sports_app/lib/"
cd live_sports_app/lib
find . -type d | sed 's|^\./||' | sed 's|[^/]*/|  |g' | sort
cd - > /dev/null

echo ""
echo "=========================================="
echo "FILE LISTING (by folder)"
echo "=========================================="
cd live_sports_app/lib

# List files grouped by folder
for dir in $(find . -type d | sort); do
  files=$(ls -1 "$dir"/*.dart 2>/dev/null | wc -l)
  if [ $files -gt 0 ]; then
    echo ""
    echo "$dir/:"
    ls -1 "$dir"/*.dart 2>/dev/null | xargs -I {} basename {}
  fi
done

