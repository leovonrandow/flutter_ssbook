import 'package:flutter/material.dart';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'Queries.dart';

class UserIcon extends StatefulWidget {
  const UserIcon({super.key});

  @override
  State<UserIcon> createState() => _UserIconState();
}

class _UserIconState extends State<UserIcon> {
  @override
  Widget build(BuildContext context) {
    // return Query(
    //     options: QueryOptions(
    //       document: gql(Queries.readUserPicture),
    //       // this is the query string you just created
    //       variables: {
    //         'nRepositories': 50,
    //       },
    //       pollInterval: const Duration(seconds: 10),
    //     ),
    //     builder: (QueryResult result,
    //         { VoidCallback? refetch, FetchMore? fetchMore }) {
    //       if (result.hasException) {
    //         return Text(result.exception.toString());
    //       }
    //
    //       if (result.isLoading) {
    //         return const Text('Loading');
    //       }
    //
    //       List? picture = result.data?['userPicture'];
    //
    //       if (picture == null) {
    //         return const Text('No picture');
    //       }

          return Container(
            margin: const EdgeInsets.only(right: 20),
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://sscdn.co/gcs/studiosol/2022/mobile/avatar.jpg'),
                    fit: BoxFit.cover
                )
            ),
          );
        }
    //);
  }
//}


