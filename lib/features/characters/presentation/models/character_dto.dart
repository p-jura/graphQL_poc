import 'package:flutter_graphql_poc/features/characters/presentation/models/character_model.dart';

class CharacterDto {
  const CharacterDto({required this.models, this.nextPage});

  final List<CharacterModel> models;
  final int? nextPage;

  factory CharacterDto.fromJson(Map<String, dynamic> json) {
    final rawResults = json['results'];
    if (rawResults is! List) {
      throw const FormatException('Missing characters.results list');
    }

    final rawInfo = json['info'];
    final info = rawInfo is Map<String, dynamic> ? rawInfo : null;

    return CharacterDto(
      models: rawResults
          .whereType<Map<String, dynamic>>()
          .map(CharacterModel.fromJson)
          .toList(growable: false),
      nextPage: info?['next'] as int?,
    );
  }
}
