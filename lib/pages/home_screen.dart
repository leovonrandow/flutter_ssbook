import 'package:flutter/material.dart';
import 'package:flutter_ssbook/graphql_service.dart';

import '../models/author_model.dart';
import '../models/book_model.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  GraphQLService _graphQLService = GraphQLService();
  List<Book>? _books;
  List<Author>? _author;

  @override
  void initState() {
    super.initState();
    _load();
  }
  void _load() async {
    _books = null;
    _books = await _graphQLService.getFavoriteBooks();
    _author = null;
    _author = await _graphQLService.getAuthors(limit: 10);
    setState(() {

    });
  }


  var height, width;

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      body: SafeArea(
        child: _books == null ? const Center(child: CircularProgressIndicator()) : _books!.isEmpty ? const Center(child: Text('No Books')) :
        ListView.builder(itemCount: _books!.length, itemBuilder: (context, index) =>
            Container(
              margin: const EdgeInsets.only(right: 15, top: 10),
              width: 198,
              height: 136,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                  image: DecorationImage(image: NetworkImage('${_books![index].cover}'),
                      fit:BoxFit.cover
                  )
              ),
            ),
        ),

        //                       scrollDirection: Axis.horizontal,
      ),
    );


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
    //              SizedBox(height: 30),
    //             Container(
    //               padding: const EdgeInsets.only(left: 10),
    //               height: 400,
    //               width: 360,
    //               child: TabBarView(
    //                 controller: _tabController,
    //                 children: [
    //                   Column(
    //                     children: [
    //                     Container(
    //                     height: 24,
    //                     width: 320,
    //                     margin: const EdgeInsets.only(left: 10, right: 10),
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text("Livros Favoritos"),
    //                           Text("ver todos")
    //                         ],
    //                       ),
    //                     ),
    //                   // ),
    //                    SizedBox(height: 20),
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

