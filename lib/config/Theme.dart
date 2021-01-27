import 'package:flutter/material.dart';

class TaskTheme {
  static const textColor = Color(0xFF152853);
  static const textSecondary = Color(0xFFc0c0c0);
  static const textAccent = Color(0xFF5b55ca);
  static const inputTextColor = Color(0xFF000000);

  static const textAlert = Color(0xFFcc3636);

  static const primary = Color(0xFF5b55ca);
  static const secondary = Color(0xFFf26850);
  static const background = Color(0xFFFDF0F4);
}

ThemeData get principalTheme {
  return ThemeData(
    fontFamily: "Nexa",
    primaryColor: TaskTheme.primary,
    accentColor: TaskTheme.secondary,
    primaryColorDark: TaskTheme.textAccent,
    primaryColorLight: Colors.white,
    backgroundColor: TaskTheme.secondary,
    scaffoldBackgroundColor: TaskTheme.background,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      color: TaskTheme.primary,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: TextTheme(
        headline5: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      button: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      headline1: TextStyle(
        color: TaskTheme.textColor,
        fontWeight: FontWeight.w900,
      ),
      headline2: TextStyle(
        color: TaskTheme.textColor,
        fontWeight: FontWeight.w900,
      ),
      headline3: TextStyle(
        color: TaskTheme.textColor,
        fontWeight: FontWeight.w900,
      ),
      headline4: TextStyle(
        color: TaskTheme.textColor,
        fontWeight: FontWeight.w900,
      ),
      headline5: TextStyle(
        color: TaskTheme.textColor,
        fontWeight: FontWeight.w900,
      ),
      headline6: TextStyle(
        color: TaskTheme.textColor,
        fontWeight: FontWeight.w900,
      ),
      subtitle2: TextStyle(
        color: TaskTheme.textColor,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: TaskTheme.textColor,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: TextStyle(
        color: TaskTheme.textColor,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        color: TaskTheme.secondary,
        fontWeight: FontWeight.bold,
      ),
      caption: TextStyle(
        color: TaskTheme.textColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: TaskTheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: TaskTheme.textAccent,
          width: 2.5,
        ),
      ),
      fillColor: TaskTheme.secondary,
      helperStyle: TextStyle(color: TaskTheme.secondary),
      labelStyle: TextStyle(color: TaskTheme.secondary),
      errorStyle: TextStyle(height: 0.9),
      hintStyle: TextStyle(
        color: TaskTheme.textAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      splashColor: TaskTheme.secondary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      buttonColor: TaskTheme.primary,
    ),
  );
}
