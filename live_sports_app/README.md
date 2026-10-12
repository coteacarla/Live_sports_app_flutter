# Live Sports Tracker

This directory contains the Flutter application for browsing live scores, fixtures, results, and match commentary across Football, Basketball, Volleyball, and Hockey.

See the [repository README](../README.md) for the full project overview, setup instructions, architecture summary, data sources, and validation commands.

## Quick Start

```bash
flutter pub get
flutter run
```

## Useful Commands

```bash
# Regenerate Riverpod and JSON/model code
dart run build_runner build --delete-conflicting-outputs

# Check and test the app
flutter analyze
flutter test
```

## Main Screens

- **Sports**: browse sports and leagues.
- **Live**: follow currently live matches with automatic refresh.
- **Results**: browse completed or scheduled matches by date.
- **Match details**: inspect commentary and key events.

## More Documentation

- [Architecture and code documentation](ARCHITECTURE.md)
- [Foundation architecture notes](docs/architecture/phase_1_foundation.md)
