import 'package:flutter/material.dart';
import 'package:untitled1/screens/login.dart';

void main() => runApp(MyApp()); // return runApp(MyApp()); =>

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthPage(),
    );
  }
}