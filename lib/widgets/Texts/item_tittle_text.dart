import 'package:flutter/cupertino.dart';
import 'package:flutter_ssbook/theme/app_theme_colors.dart';

class ItemTittleText extends StatelessWidget {
  double size;
  final String text;
  final Color? color;
  final int? lines;

  ItemTittleText({super.key,
    this.size = 14,
    required this.text,
    this.color, this.lines
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child:
             Text(
              text,
             softWrap: true,
             maxLines: 2,
              style: TextStyle(
                color: AppColors.colors.grey,
                fontSize: size,
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis
              )

            )
        ),
          ]
        );
  }
}
