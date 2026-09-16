import 'package:flutter/material.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/models/character_model.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.model});

  final CharacterModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(),
      child: Stack(children: [
      ],
    ),
    );
  }
}
