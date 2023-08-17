import 'package:flutter/material.dart';

class MyTheme {
  static final LightTheme = ThemeData(
      primaryColor: Colors.green,
      appBarTheme: AppBarTheme(color: Colors.green),
      textTheme: TextTheme(
          headline6: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white)));
}
