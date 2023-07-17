import 'package:flutter/material.dart';
import 'package:flutter_ssbook/graphqlconfig.dart';
import 'package:flutter_ssbook/pages/detail_page.dart';
import 'package:flutter_ssbook/pages/home_screen.dart';
import 'package:flutter_ssbook/pages/test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
//use THIS IN BOTH
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    'https://us-central1-ss-devops.cloudfunctions.net/GraphQL',
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  runApp(MyApp(client: client));

  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ValueNotifier<GraphQLClient> client;

  MyApp({Key? key, required this.client}) : super(key: key);

  // MyApp({Key? key, required this.client}) : super(key: key);

  var height, width;


  @override
  Widget build(BuildContext context) {
    // ValueNotifier<GraphQLClient> client = GraphQLConfig.graphInit();

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme
          ),
        ),
        home: TestPage()
        //home: HomeScreen(),

      ),
    );
  }
}

