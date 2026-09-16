class CharacterModel {
  final String id;
  final String name;
  final String species;
  final String status;
  final String image;

  const CharacterModel({
    required this.id,
    required this.name,
    required this.species,
    required this.status,
    required this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] as String,
      name: json['name'] as String,
      species: json['species'] as String,
      status: json['status'] as String,
      image: json['image'] as String,
    );
  }
}
