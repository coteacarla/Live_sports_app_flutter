# Phase 1 Foundation (Models + Contracts)

This project uses feature-first clean architecture with three layers per feature:

- Data: DTO models, datasources, repository implementations.
- Domain: entities, repository contracts, use cases.
- Presentation: screens, widgets, Riverpod providers.

Recommended structure:

```text
lib/
  core/
    error/
    network/
    notifications/
    storage/
    utils/
  features/
    sports/
      data/
        datasources/
        models/
        repositories/
      domain/
        entities/
        repositories/
        usecases/
      presentation/
        providers/
        screens/
        widgets/
    matches/
      data/
        datasources/
        models/
        repositories/
      domain/
        entities/
        repositories/
        usecases/
      presentation/
        providers/
        screens/
        widgets/
    follows/
      data/
        datasources/
        models/
        repositories/
      domain/
        entities/
        repositories/
        usecases/
      presentation/
        providers/
        screens/
        widgets/
    notifications/
      data/
        datasources/
        repositories/
      domain/
        entities/
        repositories/
        usecases/
      presentation/
        providers/
```

## State Management

Use Riverpod for app scale and composability.

## Networking

Use Dio in remote datasources and keep API provider mapping in data models.

## Local Storage

Use Hive for follows and notification preferences; keep persistence behind repositories.

## Notifications

Keep abstraction in notifications domain repository, with data implementations for:

- flutter_local_notifications for local alerts
- FCM adapter for push notifications

## Core models and contracts (Phase 1)

- Sports: Sport, League + SportsRepository
- Matches: Team, Match, MatchEvent, Commentary + MatchesRepository
- Follows: FollowEntry + FollowsRepository

All repository methods return Either<Failure, T> to enforce explicit error handling.
