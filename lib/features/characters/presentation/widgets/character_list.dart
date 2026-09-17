import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_poc/app/config.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/bloc/characters_cubit.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/widgets/character_card.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        return switch (state.status) {
          CharactersStatus.initial ||
          CharactersStatus.loading => const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          ),
          CharactersStatus.failure => SliverFillRemaining(
            child: Center(
              child: FilledButton(
                onPressed: () =>
                    context.read<CharactersCubit>().getCharacters(),
                child: const Text('Try again'),
              ),
            ),
          ),
          CharactersStatus.success when state.characters.isEmpty =>
            const SliverFillRemaining(
              child: Center(child: Text('No characters found')),
            ),
          CharactersStatus.success => SliverPadding(
            padding: Config.generalPageHorizontalPadding,
            sliver: SliverList.builder(
              itemCount: state.characters.length,
              itemBuilder: (context, index) =>
                  CharacterCard(model: state.characters[index]),
            ),
          ),
        };
      },
    );
  }
}
