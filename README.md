# Live Sports Tracker

A Flutter app for following live scores, fixtures, results, and match commentary across multiple sports.

The application currently supports Football, Basketball, Volleyball, and Hockey data. Scores and commentary come from ESPN, while sport and league metadata comes from TheSportsDB.

## Features

- Browse sports and leagues.
- View live matches with automatic refresh.
- Browse results by date.
- Open match details with commentary and key events.
- Filter matches by league.
- Follow matches with local notification preferences.
- Cache notification preferences locally and handle offline/network errors gracefully.

## Tech Stack

- Flutter and Dart 3.8+
- Riverpod 3 for state management
- Dio for HTTP requests
- ESPN scoreboard and summary APIs for match data
- TheSportsDB for sport and league metadata
- Hive and Isar for local storage and caching
- `flutter_local_notifications` for local alerts
- Firebase Messaging for push notification integration
- Freezed and `json_serializable` for immutable models and JSON mapping

## Project Structure

The Flutter project lives in [`live_sports_app`](live_sports_app/).

```text
live_sports_app/
├── lib/
│   ├── core/                  # Networking, storage, notifications, errors
│   ├── features/
│   │   ├── matches/            # Live scores, results, details, commentary
│   │   └── sports/             # Sports and league browsing
│   ├── injection/              # Shared infrastructure providers
│   ├── app.dart                # Material app and tab navigation
│   └── main.dart               # Application bootstrap
├── docs/architecture/          # Architecture notes
├── ARCHITECTURE.md             # Detailed implementation documentation
└── pubspec.yaml
```

The code follows feature-first clean architecture:

```text
Presentation -> Use case -> Repository -> Remote data source -> API
```

## Requirements

- Flutter SDK with Dart SDK `>=3.8.0 <4.0.0`
- An Android, iOS, macOS, Linux, Windows, or web Flutter target
- Firebase configuration files when using Firebase features on a target platform

## Run Locally

From the repository root:

```bash
cd live_sports_app
flutter pub get
flutter run
```

To choose a specific device:

```bash
flutter devices
flutter run -d <device-id>
```

## Code Generation

Riverpod providers and model serializers use generated Dart files. Regenerate them after changing annotated providers or models:

```bash
dart run build_runner build --delete-conflicting-outputs
```

During development, use the watcher:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

Generated files such as `providers.g.dart` should not be edited manually.

## Validation

Run formatting, static analysis, and tests from `live_sports_app`:

```bash
dart format lib test
flutter analyze
flutter test
```

## Data Sources

### ESPN

Used for live scores, scheduled fixtures, past results, and match commentary.

Scoreboard requests follow this pattern:

```text
https://site.api.espn.com/apis/site/v2/sports/{sport}/{league}/scoreboard
```

Match commentary uses the corresponding `summary` endpoint.

### TheSportsDB

Used for sport and league metadata. The app includes static fallback data for major leagues when metadata requests are unavailable.

## Notifications

The app initializes Hive and local notifications during startup. Firebase Messaging is also initialized when platform configuration is available; initialization failures are logged so the main score experience can still start.

Platform notification permissions and Firebase setup may require additional native configuration. See the platform-specific Flutter and Firebase documentation before shipping a production build.

## Documentation

- [Detailed architecture](live_sports_app/ARCHITECTURE.md)
- [Foundation architecture notes](live_sports_app/docs/architecture/phase_1_foundation.md)
- [Flutter documentation](https://docs.flutter.dev/)
