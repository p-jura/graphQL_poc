import 'package:flutter_graphql_poc/features/characters/presentation/models/character_model.dart';

class CharactersDto {
  const CharactersDto({required this.models, this.nextPage});

  final List<CharacterModel> models;
  final int? nextPage;

  factory CharactersDto.fromJson(Map<String, dynamic> json) {
    final rawResults = json['results'];
    if (rawResults is! List) {
      throw const FormatException('Missing characters.results list');
    }

    final rawInfo = json['info'];
    final info = rawInfo is Map<String, dynamic> ? rawInfo : null;

    return CharactersDto(
      models: rawResults
          .whereType<Map<String, dynamic>>()
          .map(CharacterModel.fromJson)
          .toList(growable: false),
      nextPage: info?['next'] as int?,
    );
  }
}
