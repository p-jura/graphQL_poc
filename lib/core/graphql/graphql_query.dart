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
  static const String getSingleCharacter = r'''
      query getSingleCharacter($id: ID!)
        {
          character(id: $id)
            {
              id
              name
              status
              species
              type
              gender
              image
              location
                {
                  id
                  name
                  type
                  dimension
                }
              origin
                { 
                  name
                }  
              episode
                { 
                  id
                  name
                  air_date
                }
            }
        }
''';
}

// origin
// location
