import 'package:flutter/material.dart';
import 'package:flutter_ssbook/widgets/Texts/item_desc_title.dart';
import 'package:flutter_ssbook/widgets/Texts/item_description_text.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../Queries.dart';
import '../widgets/Texts/item_subtitltte_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          document: gql(Queries.readBook),
          // this is the query string you just created
          variables: {
            "bookId": 1
          },
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const Text('Loading');
          }

          String? cover = result.data?['book']['cover'];
          String? name  = result.data?['book']['name'];
          String? author_name = result.data?['book']['author']['name'];
          String? description  = result.data?['book']['description'];

          if (cover == null) {
            return const Text('No book');
          }

          return Scaffold(
              body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    left: 20,
                    top: 70,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                        ),
                      ],
                    )),
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  //'https://sscdn.co/gcs/studiosol/2022/mobile/book/the-silmarillion.jpg'
                                  cover
                                ),
                              fit: BoxFit.cover)),
                    )),
                Positioned(
                    top: 320,
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 30, bottom: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ItemDescTittle(
                                  text:
                                      "O duque e eu (Os Bridgestons Livro 1)"),
                              //Breakar Linha do Título
                              Icon(Icons.favorite, color: Colors.deepPurple),
                            ],
                          ),
                          SizedBox(height: 15),
                          ItemSubtitleText(text: "Nome do Author"),
                          SizedBox(height: 20),
                          ItemDescText(
                              text:
                                  "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                        ],
                      ),
                    ))
              ],
            ),
          ));
        });
  }
}
