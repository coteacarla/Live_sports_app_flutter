#!/bin/bash

# Let's manually verify some suspicious ones
echo "=== Checking features/matches/presentation/widgets/league_filter_bar.dart ==="
grep -n "league_filter_bar" live_sports_app/lib/features/matches/presentation/screens/*.dart

echo ""
echo "=== Checking features/matches/presentation/widgets/match_card.dart ==="
grep -n "match_card" live_sports_app/lib/features/matches/presentation/screens/*.dart

echo ""
echo "=== Checking features/matches/presentation/widgets/match_notification_toggle.dart ==="
grep -n "match_notification_toggle" live_sports_app/lib/features/matches/presentation/screens/*.dart

echo ""
echo "=== Checking features/sports/presentation/widgets/league_list_item.dart ==="
grep -n "league_list_item" live_sports_app/lib/features/sports/presentation/screens/*.dart

echo ""
echo "=== Checking features/sports/presentation/widgets/sport_category_tile.dart ==="
grep -n "sport_category_tile" live_sports_app/lib/features/sports/presentation/screens/*.dart

