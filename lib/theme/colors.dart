import 'package:flutter/cupertino.dart';

@immutable
class ThemeColors {
  final purple = const Color.fromRGBO(160, 118, 242, 1);
  final white = const Color.fromRGBO(255, 255, 255, 1);
  final cardBorder = const Color.fromRGBO(224, 224, 224, 1);
  final backgroundgrey = const Color.fromRGBO(247, 247, 247, 1) ;
  final lightgrey = const Color.fromRGBO(117, 117, 117, 1) ;
  final grey = const Color.fromRGBO(85, 85, 85, 1);
  final labelgrey = const Color.fromRGBO(158, 158, 158, 1);

  const ThemeColors();
//(160, 118, 242, 1) APPTITTLE, DOWNSIDEBAR, 'ver todos', CASINHA COLOR, 'TODOS' BUTTON.
 //backgroundgrey(247, 247, 247, 1)   BACKGROUND COLOR OF APP
  //lightgrey(117, 117, 117, 1) AUTHOR NAMES SUBTITLE AND NUMBER OF BOOKS
  //grey(85, 85, 85, 1) ALL OTHER TEXT
 //rgba(158, 158, 158, 1) LABEL OF NAVBAR ICONS
}