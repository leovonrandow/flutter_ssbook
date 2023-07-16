import 'package:flutter/cupertino.dart';
import 'package:flutter_ssbook/theme/app_theme_colors.dart';
import 'package:flutter_ssbook/theme/colors.dart';

class AppTittleText extends StatelessWidget {
  double size;
  final String text;
  final Color? color;

  AppTittleText({super.key,
    this.size = 33,
     this.text = "SSBOOK",
      this.color ,
  });


  @override
  Widget build(BuildContext context) {
    return Text(
        text,
      style: TextStyle(
        fontFamily: 'BebasNeue',
        color: AppColors.colors.purple,
        fontSize: size,
        fontWeight: FontWeight.w400
      ),
    );
  }
}
