import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor: Colors.black,
          textTheme: const TextTheme(
            headline2: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            headline1: TextStyle(
              fontSize: 45,
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
            bodyText1: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          )),
      home: MyHomePage(),
    );
  }
}
