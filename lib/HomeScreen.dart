import 'package:flutter/material.dart';
import 'package:opera_house/homepage.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;
  final List<Widget> screens = [];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
    );
  }
}
