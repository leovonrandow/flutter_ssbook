import 'package:flutter/cupertino.dart';
import 'package:flutter_ssbook/theme/app_theme_colors.dart';

class ItemDescText extends StatelessWidget {
  double size;
  final String text;
  final Color? color;

  ItemDescText({super.key,
    this.size = 16,
    required this.text,
    this.color
  });


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.colors.grey,
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
