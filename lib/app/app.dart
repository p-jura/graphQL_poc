import 'package:flutter/material.dart';
import 'package:flutter_graphql_poc/app/routes.dart';
import 'package:flutter_graphql_poc/app/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.initial,
    );
  }
}
