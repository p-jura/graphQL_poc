import 'package:flutter/material.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/character_detail_page.dart';

import '../features/characters/presentation/start_page.dart';

abstract final class AppRoutes {
  static const charactersDetails = '/charactersDetails';
  static const startPage = '/startPage';

  static const initial = startPage;

  static Map<String, WidgetBuilder> get routes => {
    startPage: (_) => const StartPage(),
    charactersDetails: (_) => const CharacterDetailPage(),
  };
}
