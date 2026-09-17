import 'package:flutter_graphql_poc/core/graphql/graphql_query.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/models/character_dto.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract interface class RemoteDataSource<T, P> {
  Future<T> getCharacters({required P param});
}

class GraphQLRemoteDataSource implements RemoteDataSource<CharacterDto, int> {
  final GraphQLClient _client;

  const GraphQLRemoteDataSource({required GraphQLClient client})
    : _client = client;

  @override
  Future<CharacterDto> getCharacters({required int param}) async {
    final result = await _client.query(
      QueryOptions<Object?>(
        document: gql(GraphqlQuery.getCharacters),
        variables: <String, Object?>{'page': param},
        fetchPolicy: FetchPolicy.cacheFirst,
      ),
    );

    if (result.hasException) {
      throw CharactersRemoteException(result.exception.toString());
    }

    final rawCharacters = result.data?['characters'];

    return CharacterDto.fromJson(rawCharacters);
  }
}

final class CharactersRemoteException implements Exception {
  const CharactersRemoteException(this.message);

  final String message;

  @override
  String toString() => message;
}
