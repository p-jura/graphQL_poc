import 'package:flutter/material.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/character_detail_page.dart';

import '../features/characters/presentation/start_page.dart';

abstract final class AppRoutes {
  static const charactersDetails = '/charactersDetails';
  static const startPage = '/startPage';

  static const initial = startPage;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startPage:
        return MaterialPageRoute(builder: (_) => const StartPage());

      case charactersDetails:
        // Pobieramy argumenty i rzutujemy je na potrzebny typ (np. String lub Twój obiekt)
        final characterId = settings.arguments as int;

        return MaterialPageRoute(
          builder: (_) => CharacterDetailPage(id: characterId),
        );

      default:
        // Obsługa nieznanej ścieżki
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
