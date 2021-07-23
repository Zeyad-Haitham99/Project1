import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opera_house/routes.dart';
import 'package:opera_house/screens/splash/splash_screen.dart';
import 'package:opera_house/theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final title = 'Search AppBar';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      darkTheme: ThemeData.dark(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
