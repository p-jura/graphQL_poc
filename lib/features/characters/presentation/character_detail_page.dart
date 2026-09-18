import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_poc/core/di/dependency_injection.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/bloc/single_character_cubit.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/models/single_character_model.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) =>
          getIt<SingleCharacterCubit>()..getSingleCharacter(id: id),
      child: Scaffold(
        body: BlocBuilder<SingleCharacterCubit, SingleCharacterState>(
          builder: (context, state) {
            switch (state.status) {
              case SingleCharacterStatus.error:
                // TODO: Handle this case.
                throw UnimplementedError();
              case SingleCharacterStatus.initial:
              case SingleCharacterStatus.loading:
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Center(
                        child: const SizedBox(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      ),
                    ),
                  ],
                );
              case SingleCharacterStatus.loaded:
                final SingleCharacterModel character =
                    state.character ?? SingleCharacterModel.empty();

                return CustomScrollView(
                  slivers: [
                    SliverAppBar.large(
                      expandedHeight: 370,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              character.imageUrl,
                              fit: BoxFit.cover,
                            ),
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
                            icon: Icons.public_rounded,
                            label: 'Origin',
                            value: character.species,
                          ),
                          const SizedBox(height: 12),
                          _InfoTile(
                            icon: Icons.location_on_outlined,
                            label: 'Last known location',
                            value:
                                '${character.lastKnownLocation?.type}: ${character.lastKnownLocation?.name}',
                          ),
                          const SizedBox(height: 12),
                          _InfoTile(
                            icon: Icons.movie_filter_outlined,
                            label: 'First seen in',
                            value:
                                '${character.firstEpisode?.airDate} '
                                '${character.firstEpisode?.name}',
                          ),
                        ],
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });
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
