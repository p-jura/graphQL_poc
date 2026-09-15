import 'package:flutter/material.dart';
import 'package:flutter_graphql_poc/app/config.dart' show Config;
import 'package:flutter_graphql_poc/features/characters/presentation/widgets/portal_header.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  static final String _pageTitle = "Characters";
  static final String _pageSubtitle = "Who are you looking for?";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Config.generalPageHorizontalPadding,
          child: Column(
            children: [
              PortalHeader(
                eyebrow: "eyebrow",
                subtitle: _pageSubtitle,
                title: _pageTitle,
              ),
              SizedBox(child: Center(child: Text("DATA"))),
            ],
          ),
        ),
      ),
    );
  }
}
