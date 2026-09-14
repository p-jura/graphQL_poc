import 'package:flutter/material.dart';
import 'package:flutter_graphql_poc/app/config.dart';

abstract class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Config.lightTheme,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Config.lightTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Config.darkTheme,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: Config.darkTheme,
    );
  }
}
