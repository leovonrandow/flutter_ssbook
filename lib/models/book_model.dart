
import 'dart:ffi';

import 'author_model.dart';
import 'category_model.dart';

class Book {
  final String? id;
   final String name;
   final Author author;
   final String cover;
   final String description;
  final Bool isfavorite;
  final Category category;


   Book(
       {   this.id,
  required this.name,
  required this.author,
  required this.description,
  required this.cover,
  required this.isfavorite,
  required this.category});

  static Book fromMap({required Map map}) => Book(
    id: map['id'],
    name: map['name'],
    author: map['author'],
    cover: map['cover'],
    description: map['description'],
    isfavorite: map['isFavorite'],
    category: map['category'],
  );

}