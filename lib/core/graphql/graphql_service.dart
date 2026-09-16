import 'package:graphql_flutter/graphql_flutter.dart';

final class GraphqlService {
  static GraphqlService? _instance;

  late final GraphQLClient _client;

  GraphqlService._internal({required GraphQLClient client}) : _client = client;

  static Future<GraphqlService> initialize({
    GraphQLClient? client,
    HttpLink? httpLink,
    AuthLink? authLink,
    String? hiveBoxName,
  }) async {
    if (_instance != null) return _instance!;

    if (client != null) {
      return GraphqlService._instance = GraphqlService._internal(
        client: client,
      );
    }

    if (httpLink == null) {
      throw ArgumentError("No httpLink provided");
    }

    final Link link = authLink != null ? authLink.concat(httpLink) : httpLink;

    final Store store = hiveBoxName != null
        ? await HiveStore.open(boxName: hiveBoxName)
        : await HiveStore.open();

    return GraphqlService._instance = GraphqlService._internal(
      client: GraphQLClient(
        cache: GraphQLCache(store: store),
        link: link,
      ),
    );
  }

  static GraphQLClient get client {
    final instance = _instance;

    if (instance == null) {
      throw StateError('GraphQL instance is not initialized.');
    }

    return instance._client;
  }
}
