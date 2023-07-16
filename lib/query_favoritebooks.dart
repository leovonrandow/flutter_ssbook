import 'package:flutter/material.dart';
import 'package:flutter_ssbook/pages/detail_page.dart';
import 'package:flutter_ssbook/pages/home_screen.dart';
import 'package:flutter_ssbook/widgets/Texts/item_subtitltte_text.dart';
import 'package:flutter_ssbook/widgets/Texts/item_tittle_text.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'Queries.dart';

class FavoriteBooks extends StatefulWidget {
  const FavoriteBooks({super.key});

  @override
  State<FavoriteBooks> createState() => _FavoriteBooksState();
}

class _FavoriteBooksState extends State<FavoriteBooks> {
  @override
  Widget build(BuildContext context) {
    // return Query(
    //     options: QueryOptions(
    //       document: gql(Queries.readFavoriteBooks),
    //       // this is the query string you just created
    //       variables: {
    //         'nRepositories': 50,
    //       },
    //       pollInterval: const Duration(seconds: 10),
    //     ),
    //     builder: (QueryResult result,
    //         { VoidCallback? refetch, FetchMore? fetchMore }) {
    //       if (result.hasException) {
    //         return Text(result.exception.toString());
    //       }
    //
    //       if (result.isLoading) {
    //         return const Text('Loading');
    //       }
    //
    //       List? repositories = result.data?['favoriteBooks'];
    //
    //       if (repositories == null) {
    //         return const Text('No repositories');
    //       }

          return Container(
            height: 306,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(context, MaterialPageRoute(builder:
                  //         (context) => DetailPage()));
                  //     },
                    return Container(
                      height: 262,
                      width: 136,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 136,
                            height: 198,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-code.jpg',
                                        // '${repositories[index]['cover']}'),
                                ),
                                    fit: BoxFit.cover
                            ),
                          ),
                          ),
                          Container(
                              height: 36,
                              width: 136,
                                 child:
                                 ItemTittleText(text: "O duque e eu (Os Bridgertons e o almanaque servio")
                              ),
                          ItemSubtitleText(text: "Jobert Cecil Martin")
                          // Text(repositories[index]['name']),
                          // Text(repositories[index]['author']['name']),
                        ]
                      ),
                    );
            }
            ),
          );
       // });
  }
}


