
import 'package:graphql_flutter/graphql_flutter.dart';
import 'models/author_model.dart';
import 'models/book_model.dart';
import 'graphql_config.dart';

class GraphQLService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<List<Book>> getFavoriteBooks() async {
    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.noCache,
          document: gql("""
           query getFavoriteBooks{
                favoriteBooks {
                  name

                  cover
                }
              }
            """),
        ),
      );

      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        List? res = result.data?['favoriteBooks'];

        if (res == null || res.isEmpty) {
          return [];
        }

        List<Book> books =
            res.map((book) => Book.fromMap(map: book)).toList();

        return books;
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<Author>> getAuthors({
    required int limit,
  }) async {
    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.noCache,
          document: gql("""
                query  getAuthors{
                  favoriteAuthors {
                    name
                    picture
                    booksCount
                  }
                }
            """),
          variables: {
            'limit': limit,
          },
        ),
      );

      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        List? res = result.data?['getAuthors'];

        if (res == null || res.isEmpty) {
          return [];
        }

        List<Author> feelings =
        res.map((feeling) => Author.fromMap(map: feeling)).toList();

        return feelings;
      }
    } catch (error) {
      return [];
    }
  }
}
