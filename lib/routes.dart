import 'package:flutter/widgets.dart';
import 'package:opera_house/HomeScreen.dart';
import 'package:opera_house/screens/sign_up/components/sign_up_form.dart';
import 'package:opera_house/screens/forgot_password/forgot_password_screen.dart';
import 'package:opera_house/screens/login_success/login_success_screen.dart';
import 'package:opera_house/screens/sign_in/sign_in_screen.dart';
import 'package:opera_house/screens/splash/splash_screen.dart';
import 'package:opera_house/Artist.dart';
import 'package:opera_house/Event.dart';
import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ArtistPage.routeName: (context) => ArtistPage(),
  Event.routeName: (context) => Event(),
  SignUpForm.routeName: (context) => SignUpForm(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
