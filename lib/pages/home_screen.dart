import 'package:flutter/material.dart';
import 'package:flutter_ssbook/graphql_service.dart';

import '../models/book_model.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  List<Book>? _books;
  GraphQLService _graphQLService = GraphQLService();
  @override
  void initState() {
    super.initState();
    _load();
  }
  void _load() async {
    _books = null;
    _books = await _graphQLService.getFavoriteBooks(limit: 10);
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 40),
            child: Row(
              children: [
                Text(
                  "SSBOOK",
                  style: TextStyle(
                    //fontstyle: Bebas Neue
                    fontSize: width * 0.059,
                    fontWeight: FontWeight.w400,
                    color: Colors.black, //TODO Colorir diferentemente as letras
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ]
            ),
          ),
                SizedBox(height: 40),
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      controller: _tabController,
                      isScrollable: true,
                      indicatorColor: Color.fromRGBO(160, 118, 242, 1),
                      labelColor: Color.fromRGBO(85, 85, 85, 1),
                      tabs: [
                        Tab(text: "Meus Livros"),
                        Tab(text: "Emprestados"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(left: 40),
                  height: 306,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Livros Favoritos"),
                            Text("ver todos")
                          ],
                        ),
                      ),
                      ListView.builder(
                        itemCount: _books!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 262,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage(
                                        '${_books![index].cover}'
                                    )
                                )
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
            ],
          ),
    );
  }
}

