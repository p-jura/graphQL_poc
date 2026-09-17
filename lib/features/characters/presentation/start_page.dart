import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_poc/core/di/dependency_injection.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/bloc/characters_cubit.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/characters_page.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/episodes_page.dart';

enum PageCtl { characters, episodes }

class StartPage extends StatefulWidget {
  const StartPage({super.key, this.initialPage = PageCtl.characters});

  final PageCtl initialPage;

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late PageCtl currentPage;

  @override
  void initState() {
    currentPage = widget.initialPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CharactersCubit>(),
      child: Scaffold(
        body: StarterPageController.viewPage(currentPage),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentPage = PageCtl.values[value];
            });
          },
          currentIndex: currentPage.index,
          items: [
            BottomNavigationBarItem(
              label: PageCtl.characters.name,
              icon: Icon(Icons.groups),
            ),
            BottomNavigationBarItem(
              label: PageCtl.episodes.name,
              icon: Icon(Icons.tv),
            ),
          ],
        ),
      ),
    );
  }
}

abstract class StarterPageController {
  static const Map _controller = {
    PageCtl.characters: CharactersPage(),
    PageCtl.episodes: EpisodesPage(),
  };

  static Widget viewPage(PageCtl page) {
    switch (page) {
      case PageCtl.characters:
        getIt<CharactersCubit>().getCharacters(1);
      case PageCtl.episodes:
    }
    return _controller[page] ?? PageCtl.characters;
  }
}
