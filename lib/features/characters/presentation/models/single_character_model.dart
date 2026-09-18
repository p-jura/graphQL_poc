import 'package:flutter_graphql_poc/features/characters/presentation/models/character_model.dart';

class SingleCharacterModel extends CharacterModel {
  final String type;
  final String gender;
  final String? origin;
  final Location? lastKnownLocation;
  final Episode? firstEpisode;

  const SingleCharacterModel({
    required super.id,
    required super.name,
    required super.species,
    required super.status,
    required super.imageUrl,
    required this.type,
    required this.gender,
    this.origin,
    this.lastKnownLocation,
    this.firstEpisode,
  });

  factory SingleCharacterModel.fromJson(Map<String, dynamic> json) {
    final rawEpisodes = json['episode'] as List;

    return SingleCharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      imageUrl: json['image'],
      origin: json['origin']?['name'] ?? '',
      lastKnownLocation: Location.fromJson(json['location'] ?? {}),
      firstEpisode: Episode.fromJson(rawEpisodes.first),
    );
  }

  factory SingleCharacterModel.empty() {
    return SingleCharacterModel(
      id: '',
      name: '',
      species: '',
      status: '',
      imageUrl: '',
      type: '',
      gender: '',
      origin: '',
      lastKnownLocation: null,
    );
  }
}

class Episode {
  final String id;
  final String name;
  final String airDate;

  const Episode({required this.id, required this.name, required this.airDate});

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'],
      name: json['name'],
      airDate: json['air_date'],
    );
  }
}

class Location {
  final String id;
  final String name;
  final String type;

  const Location({required this.id, required this.name, required this.type});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
    );
  }
}
