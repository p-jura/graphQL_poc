import 'package:flutter_graphql_poc/features/characters/data/remote_data_source.dart';
import 'package:flutter_graphql_poc/features/characters/data/characters_dto.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/models/single_character_model.dart';

abstract class GraphqlRepository<P> {
  Future<CharactersDto> getCharacters({required P page});
  Future<SingleCharacterModel> getSingleCharacter({required P id});
}

class GraphqlRepositoryImpl implements GraphqlRepository<int> {
  final RemoteDataSource _dataSource;

  GraphqlRepositoryImpl(RemoteDataSource dataSource) : _dataSource = dataSource;
  @override
  Future<CharactersDto> getCharacters({required int page}) async {
    return await _dataSource.getCharacters(page: page);
  }

  @override
  Future<SingleCharacterModel> getSingleCharacter({required int id}) async {
    return await _dataSource.getSingleCharacter(id: id);
  }
}
