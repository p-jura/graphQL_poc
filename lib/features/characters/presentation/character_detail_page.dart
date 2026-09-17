import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/bloc/characters_cubit.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/models/character_model.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        final CharacterModel character = state.characters[id];

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar.large(
                expandedHeight: 370,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(character.imageUrl, fit: BoxFit.cover),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              theme.colorScheme.inversePrimary,
                            ],
                            stops: [.45, 1],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
                sliver: SliverList.list(
                  children: [
                    Text(
                      character.name,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      children: [
                        Chip(label: Text(character.status)),
                        Chip(label: Text(character.species)),
                      ],
                    ),
                    const SizedBox(height: 28),
                    _InfoTile(
                      Icons.public_rounded,
                      'Origin',
                      character.species,
                    ),
                    const SizedBox(height: 12),
                    const _InfoTile(
                      Icons.location_on_outlined,
                      'Last known location',
                      'Citadel of Ricks',
                    ),
                    const SizedBox(height: 12),
                    const _InfoTile(
                      Icons.movie_filter_outlined,
                      'First seen in',
                      'Pilot · Episode S01E01',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile(this.icon, this.label, this.value);
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
      leading: Icon(icon, color: Theme.of(context).colorScheme.secondary),
      title: Text(label),
      subtitle: Text(value, style: Theme.of(context).textTheme.titleMedium),
    ),
  );
}
