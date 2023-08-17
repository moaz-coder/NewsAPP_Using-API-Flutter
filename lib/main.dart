import 'package:flutter/material.dart';
import 'package:newsapp/Theme/MyTheme.dart';
import 'package:newsapp/View/SplashScreen/splashhome.dart';
import 'package:newsapp/View/homeScreen/homeScreen.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.LightTheme,
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
        });
  }
}
