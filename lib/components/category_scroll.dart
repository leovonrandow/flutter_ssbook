import 'package:flutter/material.dart';
import 'package:flutter_ssbook/theme/app_theme_colors.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../Queries.dart';
import '../widgets/Texts/item_subtitltte_text.dart';
import 'string_extension.dart';

class CategoryScroll extends StatefulWidget {
  const CategoryScroll({super.key});

  @override
  State<CategoryScroll> createState() => _CategoryScroll();
}

class _CategoryScroll extends State<CategoryScroll> {
  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          document: gql(Queries.readCategory),
          pollInterval: const Duration(seconds: 10),
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          List? repositories = result.data?['allBooks'];

          if (repositories == null) {
            return const Text('No repositories');
          }

          //Eliminando as duplicatas, tentei com toSet e  toList mas não deu certo
          final List<Map<String, dynamic>> newList = [];
          repositories.forEach((map) {
            if (!newList
                .any((newMap) => newMap['category'] == map['category'])) {
              newList.add(map);
            }
          });

          //Add o primeiro item fixo Todos para não excluir o primeiro Item Technology
          List newList2 = [
            {"category": "TODOS"},
            ...newList
          ];

          return Container(
            margin: const EdgeInsets.only(left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 32,
                    width: double.maxFinite,
                    child: ListView.builder(
                        itemCount: newList2.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: FilledButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: AppColors.colors.purple),
                                  onPressed: () {},
                                  child: ItemSubtitleText(
                                    text: "Todos",
                                    color: AppColors.colors.white,
                                  )),
                            );
                          } else {
                            return Container(
                                margin: const EdgeInsets.only(right: 10),

                                child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(width: 1, color: AppColors.colors.cardBorder)
                                      ),
                                    ),
                                    child: ItemSubtitleText(
                                      text: newList2[index]["category"].toString().capitalize(), // capitalize é uma função da extension String add na pasta e importada aqui, ela elimina a Caixa alta e capitaliza a primeira letra das categorias
                                    )));
                          }
                        }),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
