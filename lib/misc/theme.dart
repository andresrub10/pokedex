import 'package:flutter/material.dart';

const horizontalMargin = 25.0;

class AppTheme {
  static get theme => _theme;

  static ThemeData _theme = ThemeData(
    fontFamily: "Pokemon",
    canvasColor: Colors.black,
    primaryColor: Color.fromRGBO(173, 62, 69, 1),
    textTheme: TextTheme(
      subtitle1: TextStyle(color: Colors.white, fontSize: 35),
      headline1: TextStyle(color: Colors.white, fontSize: 25),
      headline2: TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      headline3: TextStyle(color: Colors.white, fontSize: 40),
    ),
  );
}
