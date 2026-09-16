import 'package:flutter/material.dart';
import 'package:flutter_graphql_poc/app/config.dart' show Config;
import 'package:flutter_graphql_poc/features/characters/presentation/widgets/character_list.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/widgets/portal_header.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  static final String _pageTitle = "Characters";
  static final String _pageSubtitle = "Who are you looking for?";
  static final String _eyebrow = "https://rickandmortyapi.com/graphql";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: Config.generalPageHorizontalPadding,
              sliver: SliverList.list(
                children: [
                  PortalHeader(
                    eyebrow: _eyebrow,
                    subtitle: _pageSubtitle,
                    title: _pageTitle,
                  ),
                  CharacterList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
