import 'package:flutter/material.dart';

enum Categories {
  vegetables,
  fruite,
  meat,
  dairy,
  carbs,
  Sweets,
  spices,
  convenience,
  hygiene,
  other
}

class Category {
  final String title;
  final Color color;

 const Category(this.title, this.color);
  
}
