import 'package:flutter/cupertino.dart';
import 'package:flutter_ssbook/theme/app_theme_colors.dart';

class AppTittleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("SS",
            style: TextStyle(
                fontFamily: 'BebasNeue',
                color: AppColors.colors.grey,
                fontSize: 33,
                fontWeight: FontWeight.w400)),
        Text("BOOK",
            style: TextStyle(
                fontFamily: 'BebasNeue',
                color: AppColors.colors.purple,
                fontSize: 33,
                fontWeight: FontWeight.w400))
      ],
    );
    // return Text(
    //   text + subtext,
    // );
  }
}
