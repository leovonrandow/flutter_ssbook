import 'dart:ffi';

import 'package:flutter_ssbook/models/book_model.dart';

class Author {
  final String? id;
  final String name;
  final String picture;
  final int bookscount;
  final Bool isfavorite;
  final Book books;

  Author({this.id, required this.name,
    required this.picture, required this.bookscount,
    required this.isfavorite, required this.books});

  static Author fromMap({required Map map}) => Author(
    id: map['id'],
    name: map['name'],
    picture: map['picture'],
    bookscount: map['bookscount'],
    isfavorite: map['isfavorite'],
    books: map['books'],
  );


}