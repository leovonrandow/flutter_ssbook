import 'package:flutter/material.dart';
import 'package:flutter_ssbook/pages/home_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


void main() {

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),

    );
  }
}

