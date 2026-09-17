abstract class GraphqlQuery {
  static const String getCharacters = r'''
    query GetCharacters($page: Int)
    {
    characters(page: $page)
      {
          info {
            count
            pages
            next
            prev
          }
          results{
            id
            name
            status
            species
            image
          }
      }
    }
''';
}
