import 'package:flutter/cupertino.dart';
import 'package:flutter_ssbook/widgets/Texts/app_large_text.dart';
import 'package:flutter_ssbook/widgets/Texts/item_subtitltte_text.dart';

import '../theme/app_theme_colors.dart';

class TittlesRow extends StatelessWidget {
  const TittlesRow({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppLargeText(text: text),
          ItemSubtitleText(text: 'ver todos', color: AppColors.colors.purple,)
        ],
      ),
    );
  }
}
