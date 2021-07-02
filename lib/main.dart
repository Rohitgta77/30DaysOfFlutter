import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/screens/home.dart';
import 'package:flutter_catalog/screens/login.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.amber),
      darkTheme: ThemeData(primarySwatch: Colors.pink),
      initialRoute: "/login",
      routes: {
        "/": (context) => LogIn(),
        "/login": (context) => LogIn(),
        "/home": (context) => Home()
      },
    );
  }

  test(bool type, {int no = 5}) {} //Optional Parameter in dart
}
