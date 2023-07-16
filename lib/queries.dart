

class Queries{
  static const String readFavoriteBooks = """
           query readRepositories{
                favoriteBooks {
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
}

