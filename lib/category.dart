import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'Queries.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          document: gql(Queries.readCategory),
          // this is the query string you just created
          variables:  {
            'nRepositories': 50,
          },
          pollInterval: const Duration(seconds: 10),
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const Text('Loading');
          }

          List? repositories = result.data?['allBooks'].toSet().toList(); //elimina as duplicatas na categoria

          if (repositories == null) {
            return const Text('No categories');
          }

          return ListView.builder(
              itemCount: repositories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(right: 15, top: 10),
                    width: 198,
                    height: 136,
                    child: FilledButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {},
                      child: Text(repositories[index]['category']),
                    ),
                  ));
        });
  }
}
