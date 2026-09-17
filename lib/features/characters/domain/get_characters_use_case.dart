import 'package:flutter_graphql_poc/core/core.dart' show UseCase;
import 'package:flutter_graphql_poc/features/characters/domain/graphql_repository.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/models/character_dto.dart';

class GetCharactersUseCase implements UseCase<Future<CharacterDto>, int> {
  final GraphqlRepository repository;

  const GetCharactersUseCase({required this.repository});

  @override
  Future<CharacterDto> call(int page) async {
    return await repository.getCharacters(page: page);
  }
}
