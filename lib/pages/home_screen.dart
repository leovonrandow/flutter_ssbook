import 'package:flutter/material.dart';
import 'package:flutter_ssbook/app_bar.dart';
import 'package:flutter_ssbook/category.dart';
import 'package:flutter_ssbook/components/bottom_nav_bar.dart';
import 'package:flutter_ssbook/favoriteauthors.dart';

import '../models/author_model.dart';
import '../models/book_model.dart';
import 'package:flutter_ssbook/query_favoritebooks.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var height, width;

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //MyAppBar(),
          SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Livros Favoritos"),
                  Text("ver todos"),
                ],
              ),
            ),
          SizedBox(height: 20),

            FavoriteBooks(),

          SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Autores Favoritos"),
                Text("ver todos"),
              ],
            ),
          ),
          SizedBox(height: 20),
            FavoriteAuthors(),
          SizedBox(height: 20),
            Text("Biblioteca"),
          SizedBox(height: 20),
            Category(),
          FavoriteBooks(),
            BottomNavBar(),
          ],
        )
    );
    ;

    // return Scaffold(
    //   body: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Container(
    //         padding: const EdgeInsets.only(top: 70, left: 40),
    //         child: Row(
    //           children: [
    //             Text(
    //               "SSBOOK",
    //               style: TextStyle(
    //                 //fontstyle: Bebas Neue
    //                 fontSize: width * 0.059,
    //                 fontWeight: FontWeight.w400,
    //                 color: Colors.black, //TODO Colorir diferentemente as letras
    //               ),
    //             ),
    //             Expanded(child: Container()),
    //             Container(
    //               margin: const EdgeInsets.only(right: 20),
    //               width: 45,
    //               height: 45,
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(40),
    //                 color: Colors.grey.withOpacity(0.5),
    //               ),
    //             ),
    //           ]
    //         ),
    //       ),
    //             SizedBox(height: 40),
    //             Container(
    //               margin: const EdgeInsets.only(left: 40),
    //               child: Align(
    //                 alignment: Alignment.centerLeft,
    //                 child: TabBar(
    //                   labelPadding: const EdgeInsets.only(left: 20, right: 20),
    //                   controller: _tabController,
    //                   isScrollable: true,
    //                   indicatorColor: Color.fromRGBO(160, 118, 242, 1),
    //                   labelColor: Color.fromRGBO(85, 85, 85, 1),
    //                   tabs: [
    //                     Tab(text: "Meus Livros"),
    //                     Tab(text: "Emprestados"),
    //                   ],
    //                 ),
    //               ),
    //             ),

    //                   Container(
    //                     height: 262,
    //                     width: double.maxFinite,
    //                     child: ListView.builder(
    //                       itemCount: _books!.length,
    //                       scrollDirection: Axis.horizontal,
    //                       itemBuilder: (BuildContext context, int index) {
    //                         return Container(
    //                           height: 262,
    //                           width: 136,
    //                           child: Column(
    //                             children: [
    //                               Container(
    //                                 margin: const EdgeInsets.only(right: 15, top: 10),
    //                                 width: 198,
    //                                 height: 136,
    //                                 decoration: BoxDecoration(
    //                                     borderRadius: BorderRadius.circular(20),
    //                                     color: Colors.grey,
    //                                     image: DecorationImage(
    //                                         image: AssetImage(
    //                                             '${_books![index].cover}'
    //                                         ),
    //                                       fit:BoxFit.cover
    //                                     )
    //                                 ),
    //                               ),
    //                               Text('${_books![index].name}'),
    //                               Text('${_books![index].name}')
    //                             ],
    //                           ),
    //                         );
    //                       },
    //                     ),
    //                   ),
    //                   ],
    //                   ),
    //                   SizedBox(height: 20),
    //                   Container(
    //                     margin: const EdgeInsets.only(left: 20, right: 20),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Text("Autores Favoritos"),
    //                         Text("ver todos"),
    //                       ],
    //                     ),
    //                   ),
    //                   SizedBox(height: 20),
    //                   ListView.builder(
    //                     itemCount: _author!.length,
    //                     scrollDirection: Axis.horizontal,
    //                     itemBuilder: (BuildContext context, int index) {
    //                       return Container(
    //                         height: 69,
    //                         width: double.maxFinite,
    //                         child: Row(
    //                           children: [
    //                             Container(
    //                               width: 67,
    //                               height: 63,
    //                               decoration: BoxDecoration(
    //                                   borderRadius: BorderRadius.circular(20),
    //                                   color: Colors.white,
    //                                   image: DecorationImage(
    //                                       image: AssetImage(
    //                                           '${_author![index].picture}'
    //                                       ),
    //                                       fit:BoxFit.cover
    //                                   )
    //                               ),
    //                             ),
    //                             Column(
    //                                 children: [
    //                                 Text('${_author![index].name}'),
    //                                 Text('${_author![index].bookscount} livros')
    //                              ]
    //                             ),
    //                           ],
    //                         ),
    //                       );
    //                     },
    //                   ),
    //                   SizedBox(height: 20),
    //                   Text('Bibilioteca'),
    //                   SizedBox(height: 20),
    //                   Container(
    //
    //                   )
    //                 ],
    //               ),
    //             ),
    //         ],
    //       ),
    // );
  }
}
