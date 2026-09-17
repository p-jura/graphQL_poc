import 'package:flutter_graphql_poc/features/characters/presentation/models/character_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CharacterDto {
  final List<CharacterModel> models;

  const CharacterDto._({required this.models});

  factory CharacterDto.fromQuery(QueryResult query) {
    final characters = query.data?['characters']?['results'];

    if (characters == null || characters is! List) {
      throw TypeError();
    }

    final result = <CharacterModel>[];

    for (var character in characters) {
      result.add(CharacterModel.fromJson(character));
    }

    return CharacterDto._(models: result);
  }
}
