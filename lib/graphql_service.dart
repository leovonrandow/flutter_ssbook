
import 'package:graphql_flutter/graphql_flutter.dart';
import 'models/book_model.dart';
import 'graphql_config.dart';

class GraphQLService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<List<Book>> getFavoriteBooks({
    required int limit,
  }) async {
    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.noCache,
          document: gql("""
           query getFavoriteBooksMain{
                favoriteBooks {
                  name
                  author {
                    name
                  }
                  cover
                }
              }
            """),
          // variables: {
          //   'limit': limit,
          // },
        ),
      );

      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        List? res = result.data?['getBooks'];

        if (res == null || res.isEmpty) {
          return [];
        }

        List<Book> feelings =
            res.map((feeling) => Book.fromMap(map: feeling)).toList();

        return feelings;
      }
    } catch (error) {
      return [];
    }
  }
}
