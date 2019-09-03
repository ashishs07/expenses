import 'package:flutter/material.dart';

import './homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.purple,
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.teal),
        fontFamily: 'Livvic',
      ),
    );
  }
}
