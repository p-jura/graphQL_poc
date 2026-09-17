import 'package:flutter/material.dart';
import 'package:flutter_graphql_poc/app/routes.dart';
import 'package:flutter_graphql_poc/app/theme.dart';
import 'package:flutter_graphql_poc/core/core.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final graphQlClient = GraphqlService.client;
    final client = ValueNotifier(graphQlClient);

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        theme: AppTheme.darkTheme,
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.initial,
      ),
    );
  }
}
