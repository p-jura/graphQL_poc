# Flutter GraphQL POC

A simple Flutter demo application that fetches character data from the public [Rick and Morty GraphQL API](https://rickandmortyapi.com/graphql).

The project explores GraphQL integration using a layered architecture and state management.

## Technologies

- Flutter and Dart
- `graphql_flutter` — API communication and GraphQL caching
- `flutter_bloc` — state management
- `get_it` — dependency injection
- `hive_ce` — local caching

## Getting started

```bash
flutter pub get
flutter run
```

The application uses the following endpoint:

```text
https://rickandmortyapi.com/graphql
```

## Current scope

The project is currently a proof of concept. It includes the basic application structure, GraphQL client configuration, a characters screen, navigation, and an initial Cubit-based data flow.

The project is still a work in progress.
