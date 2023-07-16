import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ssbook/theme/app_theme_colors.dart';

import '../widgets/Texts/item_subtitltte_text.dart';

class CategoryScroll extends StatelessWidget {
  const CategoryScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilledButton(
              style:
                  TextButton.styleFrom(foregroundColor: AppColors.colors.purple),
              onPressed: () {},
              child: ItemSubtitleText(
                text: "Todos",
                color: AppColors.colors.white,
              )),
          Container(
            height: 32,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: OutlinedButton(
                      onPressed: () {},
                      child: ItemSubtitleText(
                        text: 'Recebe variavel',
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
