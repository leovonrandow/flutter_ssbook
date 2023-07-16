import 'package:flutter/material.dart';
import 'package:flutter_ssbook/user_icon.dart';


class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(top: 70, left: 40),
      child: Row(
          children: [
            Text(
              "SSBOOK",
              style: TextStyle(
                //fontstyle: Bebas Neue
                fontSize: 33,
                fontWeight: FontWeight.w400,
                color: Colors.black, //TODO Colorir diferentemente as letras
              ),
            ),
            Expanded(child: Container()),
           UserIcon()
          ]
      ),
    );
  }
}
