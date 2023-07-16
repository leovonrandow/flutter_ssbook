import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
         children: [
           Positioned(
             left: 20,
               top: 70,
               child: Row(
             children: [
               IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),
                 color: Colors.white,
               ),

             ],
           )),
           Positioned(
             left: 0,
               right: 0,
               child: Container(
                 width: double.maxFinite,
                 height: 350,
                 decoration: BoxDecoration(
                     image: DecorationImage(
                         image: NetworkImage(
                             'image'),
                         fit: BoxFit.cover
                     )
                 ),
               )),
           Positioned(
                top: 320,
               child: Container(
                 padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                 width: MediaQuery.of(context).size.width,
                 height: 500,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(30))
                 ),
                 child: Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                       Text("Titulo do Livro" ),//Breakar Linha do Título
                       Icon(Icons.favorite, color: Colors.deepPurple),
                     ],
                     ),
                     SizedBox(height: 8),
                     Text("Nome do Author"),
                     SizedBox(height: 10),
                     Text("Description"),

                   ],
                 ),

           ))
         ],
        ),
      )
    );
  }
}
