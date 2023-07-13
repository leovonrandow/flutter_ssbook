import 'package:flutter/material.dart';
import 'package:flutter_ssbook/pages/home_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


void main() {
  final HttpLink httpLink = HttpLink('https://us-central1-ss-devops.cloudfunctions.net/GraphQL');

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );

  var app = GraphQLProvider(client: client, child: MyApp());

  runApp(app);
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

