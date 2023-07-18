import 'package:flutter/material.dart';
import 'package:flutter_ssbook/theme/app_theme_colors.dart';
import 'package:flutter_ssbook/widgets/Texts/item_subtitltte_text.dart';
import 'package:flutter_ssbook/widgets/Texts/item_tittle_text.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../Queries.dart';



class FavoriteAuthors extends StatefulWidget {
  const FavoriteAuthors({super.key});

  @override
  State<FavoriteAuthors> createState() => _FavoriteAuthors();
}

class _FavoriteAuthors extends State<FavoriteAuthors> {
  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          document: gql(Queries.readFavoriteAuthors),
          pollInterval: const Duration(seconds: 10),
        ),
        builder: (QueryResult result,
            { VoidCallback? refetch, FetchMore? fetchMore }) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          List? repositories = result.data?['favoriteAuthors'];

          if (repositories == null) {
            return const Text('No authors');
          }

          return Container(
              height: 67,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                  itemCount: repositories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                        width: 248,
                        height: 69,
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.colors.cardBorder, width: 1),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),

                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                width: 63,
                                height: 67,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${repositories[index]['picture']}'
                                          //'https://sscdn.co/gcs/studiosol/2022/mobile/author/uncle-bob.jpg'
                                        ),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              Container(
                                width: 140,
                                height: 67,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ItemTittleText(
                                        text: '${repositories[index]['name']}'),
                                    SizedBox(height: 5),
                                    ItemSubtitleText(
                                        text: '${repositories[index]['booksCount']} livros')
                                  ],
                                ),
                              )
                            ]
                        )
                    );
                    // });
                  }
              )
          );
        });
  }
}