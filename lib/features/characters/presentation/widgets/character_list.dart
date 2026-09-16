import 'package:flutter/material.dart';
import 'package:flutter_graphql_poc/core/graphql/graphql_query.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(document: gql(GraphqlQuery.getCharacters)),
      builder: (result, {fetchMore, refetch}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        List? repositories = result.data?['viewer']?['repositories']?['nodes'];

        if (repositories == null) {
          return const Text('No repositories');
        }
        return Container();
      },
    );
  }
}
