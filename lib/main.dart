import 'package:flutter/material.dart';
import 'package:operahouse/Welcome_Screen.dart';
import 'package:operahouse/loginPage.dart';

//Welcome Screen
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: Welcomescreen.id,
      routes: {
        Welcomescreen.id: (context) => Welcomescreen(),
        LoginPage.id: (context) => LoginPage()
      },
    );
  }
}
