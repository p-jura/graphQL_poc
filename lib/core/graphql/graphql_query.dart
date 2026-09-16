abstract class GraphqlQuery {
  static const String getCharacters = r'''
    query GetCharacters(){
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
''';
}
