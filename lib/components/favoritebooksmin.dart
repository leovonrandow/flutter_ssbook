import 'package:flutter/material.dart';
import 'package:flutter_ssbook/pages/detail_page.dart';
import 'package:flutter_ssbook/widgets/Texts/item_subtitltte_text.dart';
import 'package:flutter_ssbook/widgets/Texts/item_tittle_text.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../Queries.dart';

class FavoriteBooksMin extends StatefulWidget {
  const FavoriteBooksMin({super.key});

  @override
  State<FavoriteBooksMin> createState() => _FavoriteBooksMinState();
}

class _FavoriteBooksMinState extends State<FavoriteBooksMin> {
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

          return Expanded(
            child: Container(
              height: double.maxFinite,
              //width: 320,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 20 ),
              child: ListView.builder(

                  physics: NeverScrollableScrollPhysics(),
                  itemCount: repositories.length,
                  scrollDirection: Axis.vertical,
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
                        height: 70,
                        width: 320,
                        margin: const EdgeInsets.only(top: 15),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: 48,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
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
                                height: 70,
                                width: 265,
                                padding: const EdgeInsets.only(top: 5),
                                child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ItemTittleText(text: repositories[index]['name']),
                                    SizedBox(height: 8),
                                    ItemSubtitleText(text: repositories[index]['author']['name'])
                                  ],
                                ),

                                //ItemTittleText(text: "O duque e eu (Os Bridgertons e o almanaque servio")
                              ),

                              //ItemSubtitleText(text: "Jobert Cecil Martin")

                              // ItemTittleText(text: repositories[index]['name']),
                              // ItemTittleText(text: repositories[index]['author']['name']),
                            ]
                        ),
                      ),
                    );
                  }
              ),
            ),
          );
        });
  }
}


