import 'package:flutter/material.dart';
import 'package:flutter_graphql_poc/app/app.dart';
import 'package:flutter_graphql_poc/core/core.dart';
import 'package:flutter_graphql_poc/core/di/dependency_injection.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.initialize();
  await GraphqlService.initialize(
    hiveBoxName: 'graphql_cache',
    httpLink: HttpLink('https://rickandmortyapi.com/graphql'),
  );
  await DependencyInjection.initialize();

  runApp(const App());
}
