import 'package:flutter/material.dart';
import 'package:flutter_graphql_poc/app/app.dart';
import 'package:flutter_graphql_poc/core/graphql/graphql_service.dart';
import 'package:flutter_graphql_poc/core/hive/hive_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final String hiveBoxName = DateTime.now().microsecondsSinceEpoch.toString();
  await HiveService.initialize();
  await HiveService.openBox(hiveBoxName);

  await GraphqlService.initialize(
    hiveBoxName: hiveBoxName,
    httpLink: HttpLink('https://rickandmortyapi.com/graphql'),
  );

  runApp(const App());
}
