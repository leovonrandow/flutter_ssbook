//
// import 'dart:js_interop';
//
// import 'package:flutter_ssbook/pages/test.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
//
// import 'graphqlconfig.dart';
//
//
// class ApiClients{
//
//
//
//   String readHomeScreen =  '''
//             query readRepositories{
//             userPicture
//                 favoriteBooks {
//                   cover
//                   name
//                   author{
//                      name
//                   }
//                 }
//              favoriteAuthors {
//                   name
//                   picture
//                   booksCount
//                   isFavorite
//                 }
//               }
//     ''';
//
//   ///Example on how to implement query to get country
//   Future<Object>  getAll(String code) async {
//     TestPage testPage = TestPage();
//     try {
//
//       ///initializing GraphQLConfig
//       GraphQLConfig graphQLConfiguration = GraphQLConfig();
//       GraphQLClient _client = graphQLConfiguration.clientToQuery();
//       QueryResult result = await _client.query(
//
//         QueryOptions(
//             document: gql(readHomeScreen),
//             variables: {
//               "input": "$code"
//             }
//         ),
//       );
//
//       if (result.hasException) {
//         throw Exception(result.exception);
//       }
//
//       testPage = TestPage.fromJson(result.data?? {});
//
//       if (testPage == null || testPage.isNull) {
//         return [];
//       };
//
//         return res;
//
//     } catch (error) {
//       throw Exception(error);
//     }
//   }
//   }