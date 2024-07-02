import 'dart:math';

import 'package:flutter/material.dart';

import 'widgets/grocery_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 142, 95, 222),
          surface: const Color.fromARGB(255, 199, 176, 110),
        ),
        useMaterial3: true,
      ),
      home: Scaffold(body: const GroceryList()),
    );
  }
}
