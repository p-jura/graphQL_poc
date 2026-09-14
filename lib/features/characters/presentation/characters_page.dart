import 'package:flutter/material.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  static final String _pageTitle = "CharactersPage";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitle, style: theme.textTheme.titleMedium),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: Text("data", style: theme.textTheme.labelMedium),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Container(child: Center(child: Text("DATA"))),
    );
  }
}
