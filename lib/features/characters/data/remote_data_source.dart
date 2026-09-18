import 'package:flutter_graphql_poc/core/graphql/graphql_query.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/models/characters_dto.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/models/single_character_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract interface class RemoteDataSource<P> {
  Future<CharactersDto> getCharacters({required P page});
  Future<SingleCharacterModel> getSingleCharacter({required P id});
}

class GraphQLRemoteDataSource implements RemoteDataSource<int> {
  final GraphQLClient _client;

  const GraphQLRemoteDataSource({required GraphQLClient client})
    : _client = client;

  @override
  Future<CharactersDto> getCharacters({required int page}) async {
    final result = await _client.query(
      QueryOptions<Object?>(
        document: gql(GraphqlQuery.getCharacters),
        variables: <String, Object?>{'page': page},
        fetchPolicy: FetchPolicy.cacheFirst,
      ),
    );

    if (result.hasException) {
      throw CharactersRemoteException(result.exception.toString());
    }

    final rawCharacters = result.data?['characters'];

    return CharactersDto.fromJson(rawCharacters);
  }

  @override
  Future<SingleCharacterModel> getSingleCharacter({required int id}) async {
    final result = await _client.query(
      QueryOptions(
        document: gql(GraphqlQuery.getSingleCharacter),
        variables: {'id': id},
      ),
    );

    if (result.hasException) {
      throw CharactersRemoteException(result.exception.toString());
    }

    final rawCharacter = result.data?['character'];
    return SingleCharacterModel.fromJson(rawCharacter);
  }
}

final class CharactersRemoteException implements Exception {
  const CharactersRemoteException(this.message);

  final String message;

  @override
  String toString() => message;
}
