import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opera_house/components/custom_surfix_icon.dart';
import 'package:opera_house/components/form_error.dart';
import 'package:opera_house/screens/forgot_password/forgot_password_screen.dart';
import 'package:opera_house/screens/login_success/login_success_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../../../globals.dart' as globals;

class SignForm extends StatefulWidget {


  @override
  _SignFormState createState() => _SignFormState();
}
class _SignFormState extends State<SignForm> {


  // ignore: missing_return
  Future<dynamic> logindata() async {
    http.Response response = await http.post(
      Uri.encodeFull("https://cairo-opera.herokuapp.com/login"),
      headers: {
        "Accept": "opera_house/json",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"email": email, "password": password}),
    );

    return jsonDecode(response.body);
  }

  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          // ignore: deprecated_member_use
          DefaultButton(
            text: "Login",
            press: () async {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: CircularProgressIndicator()),
                      ],
                    );
                  });
              var response = await logindata();
              setState(() {
                print(response);
                if (response['success'] == true) {
                  print('success in login');
                  globals.customer_id= response["customer_id"];
                  // rroute...
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginSuccessScreen()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: Text('Error'),
                      content: Text('Check Your Email and Password'),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          child: Text("ok"),
                          onPressed: () {
                            print("bye");
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                  print('fail in login');
                  print(response);
                }
              });
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        setState(() {
          password = value;
          print(password);
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        setState(() {
          email = value;
          print(email);
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
