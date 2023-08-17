import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapp/View/homeScreen/homeScreen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "initialScreen";

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            "assets/images/pattern.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Image.asset("assets/images/logo.png"),
          ),
        ),
      ],
    );
  }
}
