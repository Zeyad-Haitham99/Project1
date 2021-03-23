import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Header.dart';
import 'inputWrapper.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'login_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.cyan[500],
            Colors.cyan[300],
            Colors.cyan[400],
          ]),
        ),
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(60.0),
                  height: 100.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            Header(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(60.0),
                    )),
                child: InputWrapper(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
