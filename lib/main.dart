import 'package:flutter/material.dart';
import 'package:santos_as_cegas/screens/main_screen.dart';
import 'package:santos_as_cegas/util/const.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: MainScreen(),
    );
  }
}
