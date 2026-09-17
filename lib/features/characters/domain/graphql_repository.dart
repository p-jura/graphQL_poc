import 'package:flutter_graphql_poc/features/characters/data/remote_data_source.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/models/character_dto.dart';

abstract class GraphqlRepository<T, P> {
  T getCharacters({required P page});
}

class GraphqlRepositoryImpl
    implements GraphqlRepository<Future<CharacterDto>, int> {
  final RemoteDataSource _dataSource;

  GraphqlRepositoryImpl(RemoteDataSource dataSource) : _dataSource = dataSource;
  @override
  Future<CharacterDto> getCharacters({required int page}) async {
    return await _dataSource.getCharacters(param: page);
  }
}
