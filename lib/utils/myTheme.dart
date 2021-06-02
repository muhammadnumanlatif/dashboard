import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.amber,
      cardColor: Colors.white,
      canvasColor: lightAmberColor,
      buttonColor: darkTealColor,
      accentColor: darkTealColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      cardColor: Colors.black,
      canvasColor: darkAmberColor,
      buttonColor: lightTealColor,
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6:
                  Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
            ),
      ));

  //Colors
  static Color lightAmberColor = Colors.amber.shade500;
  static Color darkAmberColor = Colors.amber.shade800;
  static Color darkTealColor = Colors.teal.shade800;
  static Color lightTealColor = Colors.teal.shade500;
}