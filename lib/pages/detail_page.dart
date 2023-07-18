import 'package:flutter/material.dart';
import 'package:flutter_ssbook/widgets/Texts/item_desc_title.dart';
import 'package:flutter_ssbook/widgets/Texts/item_description_text.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../Queries.dart';
import '../components/bottom_nav_bar.dart';
import '../theme/app_theme_colors.dart';
import '../widgets/Texts/item_subtitltte_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.bookid});

  final String? bookid;


  @override
  State<DetailPage> createState() => _DetailPageState();
}



class _DetailPageState extends State<DetailPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          document: gql(Queries.readBook),
          // this is the query string you just created
          variables: {"bookId": widget.bookid},
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const Text('Loading');
          }

          Map<String, dynamic>? book = result.data?['book'];
          // String? name  = result.data?['book']['name'];
          // String? author_name = result.data?['book']['author']['name'];
          // String? description  = result.data?['book']['description'];

          if (book == null) {
            return const Text('No book');
          }

          return Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: AppColors.colors.white,
                // child: Column(
                //   children: [
                //     Container(
                //       height: 350,
                //       width: 360,
                //       child: Stack(
                //         children: [],
                //       ),
                //     )
                //   ],
                // ),VAI ATÈ AQUIII
                  child: Stack(
                    children: [
                          // alignment: Alignment.topCenter,
                      Positioned(
                          left: 0,
                          right: 0,
                          child: Container(
                            width: double.maxFinite,
                            height: 520,
                            padding: const EdgeInsets.only(
                                top: 30),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        //'https://sscdn.co/gcs/studiosol/2022/mobile/book/the-silmarillion.jpg'
                                        '${book['cover']}'
                                      ),
                                    fit: BoxFit.cover)),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                              height: 24,
                              width: 360,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size:  24,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                      size:  24,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            ),
                          ),
                            ),

                       Positioned(
                            top: 380,
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 30),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.only(topLeft: Radius.circular(30))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 300,
                                        height: 46,
                                        child: ItemDescTittle(
                                            text:
                                            '${book['name']}'),
                                      ),
                                              //"O duque e eu (Os Bridgestons Livro 1)"),
                                      //Breakar Linha do Título
                                      Icon(Icons.favorite, color: AppColors.colors.purple),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  ItemSubtitleText(text: '${book['author']['name']}'),
                                  SizedBox(height: 20),
                                  ItemDescText(
                                      text: '${book['description']}')

                                          //"is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                                ],
                              ),
                            )),

                    ],
                  ),
              ),
              //Repeti o Bottom Nav bar aqui, sei que não é o certo mas foi por falta de tempo.
              bottomNavigationBar: BottomNavBar(),
          );
        });
  }
}
