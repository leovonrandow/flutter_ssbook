import 'package:flutter/cupertino.dart';
import 'package:flutter_ssbook/theme/app_theme_colors.dart';

class ItemSubtitleText extends StatelessWidget {
  double size;
  final String text;
  final Color? color;

  ItemSubtitleText({super.key,
    this.size = 14,
    required this.text,
    this.color = const Color.fromRGBO(117, 117, 117, 1)
  });


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
