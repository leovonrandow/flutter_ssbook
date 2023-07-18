import 'package:flutter/material.dart';
import 'package:flutter_ssbook/pages/detail_page.dart';
import 'package:flutter_ssbook/widgets/Texts/item_subtitltte_text.dart';
import 'package:flutter_ssbook/widgets/Texts/item_tittle_text.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../Queries.dart';



class FavoriteBooks extends StatefulWidget {
  const FavoriteBooks({super.key});

  @override
  State<FavoriteBooks> createState() => _FavoriteBooksState();
}

class _FavoriteBooksState extends State<FavoriteBooks> {
  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          document: gql(Queries.readFavoriteBooks),
          // this is the query string you just created
          pollInterval: const Duration(seconds: 10),
        ),
        builder: (QueryResult result,
            { VoidCallback? refetch, FetchMore? fetchMore }) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          List? repositories = result.data?['favoriteBooks'];

          if (repositories == null) {
            return const Text('No repositories');
          }

          return Container(
            height: 306,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: repositories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(context, MaterialPageRoute(builder:
                  //         (context) => DetailPage()));
                  //     },
                    return InkWell(
                      onTap: ( ) {
                         Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>
                          new DetailPage(bookid: '${repositories[index]['id']}')
                          )
                        );
                      },
                      child: Container(
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
                                         // 'https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-code.jpg',
                                           '${repositories[index]['cover']}'),
                                            fit: BoxFit.cover
                                  ),
                              ),
                            ),

                            Container(
                                height: 36,
                                width: 124,
                                   child:
                                    ItemTittleText(text: repositories[index]['name']),
                                   //ItemTittleText(text: "O duque e eu (Os Bridgertons e o almanaque servio")
                                ),
                            ItemSubtitleText(text: repositories[index]['author']['name'])
                            //ItemSubtitleText(text: "Jobert Cecil Martin")

                            // ItemTittleText(text: repositories[index]['name']),
                            // ItemTittleText(text: repositories[index]['author']['name']),
                          ]
                        ),
                      ),
                    );
            }
            ),
          );
        });
  }
}


