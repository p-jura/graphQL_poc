import 'package:flutter/material.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/models/character_model.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.model});

  final CharacterModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            model.imageUrl.toString(),
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                const Icon(Icons.broken_image_outlined),
          ),
        ),
        title: Text(model.name),
        subtitle: Text('${model.species} · ${model.status}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Nawigacja z typowanym argumentem/id.
        },
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   final theme = Theme.of(context);

  //   return Card(
  //     shape: BeveledRectangleBorder(),
  //     child: Stack(
  //       children: [
  //         ClipRRect(
  //           borderRadius: BorderRadiusGeometry.circular(10),
  //           child: Image.network(
  //             model.image,
  //             alignment: AlignmentGeometry.center,
  //             fit: BoxFit.fill,
  //           ),
  //         ),
  //         SizedBox(
  //           child: Column(
  //             children: [
  //               Text(model.name, style: theme.textTheme.bodyLarge),
  //               Text(
  //                 model.species,
  //                 style: theme.textTheme.bodySmall?.copyWith(
  //                   color: theme.colorScheme.onSurfaceVariant,
  //                 ),
  //               ),
  //               Text(model.status, style: theme.textTheme.bodyMedium),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
