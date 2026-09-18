import 'package:flutter_graphql_poc/core/use_case/use_case.dart';
import 'package:flutter_graphql_poc/features/characters/domain/graphql_repository.dart';

import 'package:flutter_graphql_poc/features/characters/presentation/models/single_character_model.dart';

class GetSingleCharacterUseCase
    implements UseCase<Future<SingleCharacterModel>, int> {
  final GraphqlRepository _repository;

  GetSingleCharacterUseCase({required GraphqlRepository repository})
    : _repository = repository;

  @override
  Future<SingleCharacterModel> call(id) async {
    return await _repository.getSingleCharacter(id: id);
  }
}
