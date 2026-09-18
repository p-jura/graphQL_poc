import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_poc/core/ui/empty_page.dart';
import 'package:flutter_graphql_poc/core/ui/exception_widget.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/bloc/characters_cubit.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/widgets/character_card.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  void _showError(BuildContext context, String? message) {
    showDialog(
      context: context,
      builder: (_) => Center(child: ExceptionWidget(message: message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharactersCubit, CharactersState>(
      listener: (context, state) {
        if (state.status.isError) {
          _showError(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return switch (state.status) {
          CharactersStatus.initial => const SliverFillRemaining(
            child: EmptyPageView(),
          ),
          CharactersStatus.loading => const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          ),
          CharactersStatus.error => SliverFillRemaining(
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
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 112),
            sliver: SliverLayoutBuilder(
              builder: (context, constraints) => SliverGrid.builder(
                itemCount: state.characters.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: constraints.crossAxisExtent >= 900 ? 2 : 1,
                  mainAxisExtent: 152,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) =>
                    CharacterCard(character: state.characters[index]),
              ),
            ),
          ),
        };
      },
    );
  }
}
