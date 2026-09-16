import 'package:flutter/material.dart';
import 'package:flutter_graphql_poc/app/app.dart';
import 'package:flutter_graphql_poc/core/services/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.initialize();
  runApp(const App());
}
