import 'package:flutter_ssbook/components/tab_bar_container.dart';
import 'package:flutter_ssbook/components/tittles_row.dart';
import 'package:flutter_ssbook/favoriteauthors.dart';
import 'package:flutter_ssbook/query_favoritebooks.dart';
import 'package:flutter_ssbook/theme/app_theme_colors.dart';
import 'package:flutter_ssbook/user_icon.dart';
import 'package:flutter_ssbook/widgets/Texts/app_large_text.dart';
import 'package:flutter_ssbook/widgets/Texts/item_tittle_text.dart';
import 'package:flutter_ssbook/widgets/Texts/tab_bar_text.dart';

import '../widgets/Texts/app_tittle_text.dart';
import 'package:flutter/material.dart';

import '../widgets/Texts/item_subtitltte_text.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  var height, width;

  @override
  Widget build(BuildContext context) {

    //getting the device media dimensions
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return
      SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body:
          Container(
            height: height,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 24, left: 20),
                          child: Row(
                            children: [
                              AppTittleText(),
                              Expanded(child: Container()),
                              UserIcon()
                            ],
                          )
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                              child: Row(
                                children: [
                                  TabBarContainer(text: 'Meus livros'),
                                  TabBarContainer(text: 'Emprestados'),
                                ],
                              ),
                            )
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TittlesRow(text: 'Livros Favoritos',),
                SizedBox(height: 20),
                 FavoriteBooks(),
                 TittlesRow(text: 'Autores Favoritos',),
                 SizedBox(height: 20),
                FavoriteAuthors(),
                SizedBox(height: 30),
                //FavoriteAuthors()



                // Ap
              ],
            ),
          ),

        ),
      );

      // Row(
      //   children: [
      //     TabBarText(text: "Meus Livros"),
      //     TabBarText(text: "Emprestados")
      //   ],
      // )
    //AppLargeText(text: "Livros Favoritos")
      //ItemSubtitleText(text: "ver todos", color: AppColors.colors.purple,)
      //ItemTittleText(text: "O Duque e eue Os BALSBLABSDLBAS")
      //ItemSubtitleText(text: "Julia Quin")
      // AppLargeText(text: "Autores Favoritos")
      //ItemSubtitleText(text: "ver todos", color: AppColors.colors.purple,)

      //ItemTittleText(text: "Conni Brockasdiosaj")
      //ItemSubtitleText(text: "6 livros")

      //AppLargeText(text: "Bibilioteca")
      //ItemSubtitleText(text: "Romance")

      //ItemTittleText(text: "O Duque e eue Os BALSBLABSDLBAS")
      //ItemSubtitleText(text: "Julia Quin")
    ;
  }
}
