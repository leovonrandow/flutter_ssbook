
import 'package:flutter/cupertino.dart';
import 'package:flutter_ssbook/theme/app_theme_colors.dart';

import '../widgets/Texts/tab_bar_text.dart';

class TabBarContainer extends StatelessWidget {
  const TabBarContainer({super.key, required this.text});

  final String text;
  //final Bool? border

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: const EdgeInsets.only(left: 20, right: 10),
        padding: const EdgeInsets.all(15),
        child: TabBarText(text: text),
        decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.colors.purple))
        ),
      );
  }


}
