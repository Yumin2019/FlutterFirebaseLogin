import 'package:flutter/material.dart';
import 'package:untitled1/screens/login.dart';
import 'package:provider/provider.dart';
import 'data/JoinOrLogin.dart';

void main() => runApp(MyApp()); // return runApp(MyApp()); =>

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<JoinOrLogin>.value(
        value: JoinOrLogin(),
        child: AuthPage(),
      ),
    );
  }
}
