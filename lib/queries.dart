

class Queries{
  static const String readFavoriteBooks = """
           query readRepositories{
                favoriteBooks {
                  id
                  cover
                  name
                  author{
                     name
                  }
                }
              }
            """;
  static const String readFavoriteAuthors = """
           query readRepositories{
                  favoriteAuthors {
                  name
                  picture
                  booksCount
                  isFavorite
                }
              }
            """;
  static const String readCategory = """
           query readRepositories{
               allBooks{
                 category
                 }
              }
            """;
  static const String readUserPicture = """
           query readRepositories{
                userPicture
                }
            """;

  static const String readBook = """
            query GetBook(\$bookId: ID!) {
            book(id: \$bookId) {
              cover
              name
                  author{
                name
              }
              description
            }
          }
        """;

}

