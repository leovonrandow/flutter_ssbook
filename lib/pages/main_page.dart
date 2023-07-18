import 'package:flutter_ssbook/components/bottom_nav_bar.dart';
import 'package:flutter_ssbook/components/category_scroll.dart';
import 'package:flutter_ssbook/widgets/tittles_row.dart';

import 'package:flutter_ssbook/theme/app_theme_colors.dart';
import 'package:flutter_ssbook/widgets/user_icon.dart';
import 'package:flutter_ssbook/widgets/Texts/app_large_text.dart';
import 'package:flutter_ssbook/widgets/Texts/tab_bar_text.dart';

import '../components/favoriteauthors.dart';
import '../components/favoritebooks.dart';
import '../components/favoritebooksmin.dart';
import '../widgets/Texts/app_tittle_text.dart';
import 'package:flutter/material.dart';



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var height, width;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //coloquei as medidas para fazer resposivo mas fiz estatico mesmo, pra ir vendo como fica cada componente na tela e copiando o layout do Figma.
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return  Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    color: AppColors.colors.white,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(top: 24, left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTittleText(),
                            Expanded(child: Container()),
                            UserIcon()
                          ],
                        )),
                    SizedBox(height: 5),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 20, right: 10),
                                padding: const EdgeInsets.all(10),
                                child: TabBarText(text: 'Meus livros'),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 4,
                                            color: AppColors.colors.purple))),
                              ),
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  child: TabBarText(text: 'Emprestados')),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 30),
              TittlesRow(
                text: 'Livros Favoritos',
              ),
              SizedBox(height: 12),
              FavoriteBooks(),
              Container(
                  height: height,
                  width: width,
                  padding: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      color: AppColors.colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(40))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TittlesRow(text: 'Autores Favoritos'),
                      SizedBox(height: 20),
                      FavoriteAuthors(),
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child: AppLargeText(text: "Biblioteca")),
                      SizedBox(height: 20),
                      CategoryScroll(),
                      FavoriteBooksMin(),
                    ],
                  )
                  ),

            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      );


  }
}
