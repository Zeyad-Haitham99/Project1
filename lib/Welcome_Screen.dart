import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginPage.dart';

class Welcomescreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomescreenState createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                    width: 60.0,
                  ),
                ),
                Expanded(
                  child: Text(
                    'OPERA HOUSE',
                    style:
                        TextStyle(fontSize: 35.0, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text('Login'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
