import 'package:flutter_graphql_poc/features/characters/data/remote_data_source.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/models/character_dto.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class GraphqlRepository<T, P> {
  T getCharacters({required P page});
}

class GraphqlRepositoryImpl
    implements GraphqlRepository<Future<CharacterDto>, int> {
  final RemoteDataSource _dataSource;

  GraphqlRepositoryImpl(RemoteDataSource dataSource) : _dataSource = dataSource;
  @override
  Future<CharacterDto> getCharacters({required int page}) async {
    final QueryResult result = await _dataSource.getCharacters(page);

    return CharacterDto.fromQuery(result);
  }
}
