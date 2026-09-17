import 'package:flutter_graphql_poc/core/graphql/graphql_query.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract interface class RemoteDataSource<T, Param> {
  Future<T> getCharacters(Param param);
}

class GraphQLRemoteDataSource implements RemoteDataSource<QueryResult, int> {
  final GraphQLClient client;

  GraphQLRemoteDataSource({required this.client});
  @override
  Future<QueryResult> getCharacters(int page) async {
    try {
      return await client.query(
        QueryOptions(
          document: gql(GraphqlQuery.getCharacters),
          variables: {'page': page},
        ),
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
