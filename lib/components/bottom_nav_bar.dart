import 'package:flutter/material.dart';
import 'package:flutter_ssbook/pages/detail_page.dart';
import 'package:flutter_ssbook/pages/main_page.dart';
import 'package:flutter_ssbook/theme/app_theme_colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {


  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        selectedItemColor: AppColors.colors.purple,
        unselectedItemColor:  AppColors.colors.labelgrey,
        items:  [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: "Adicionar"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoritos"),
        ],
      );
  }
}
