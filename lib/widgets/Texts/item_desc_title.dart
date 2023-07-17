import 'package:flutter/cupertino.dart';
import 'package:flutter_ssbook/theme/app_theme_colors.dart';

class ItemDescTittle extends StatelessWidget {
  double size;
  final String text;
  final Color? color;

  ItemDescTittle({super.key,
    this.size = 20,
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
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
