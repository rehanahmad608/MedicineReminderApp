import 'package:flutter/material.dart';
import 'package:stellar/app.dart';

final robotheme = ThemeData(
  hintColor: const Color(0xffBBBBBB),
  scaffoldBackgroundColor: Colors.white,
  // primaryColor: themeColor,
  colorScheme: const ColorScheme(
      primary: themeColor,
      primaryContainer: themeColor,
      secondary: Color.fromARGB(255, 255, 255, 255),
      secondaryContainer: Color.fromARGB(255, 255, 255, 255),
      surface: Colors.white,
      background: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  fontFamily: 'ProximaNova',
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline2: TextStyle(fontSize: 28.0, color: Colors.black),
    headline3: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline4: TextStyle(fontSize: 22.0, color: Colors.black),
    headline5: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
    headline6: TextStyle(fontSize: 18, color: Colors.black),
    // headline6: TextStyle(fontSize: 14, color: Colors.black),
    bodyText1: TextStyle(fontSize: 16),
    // bodyText1: TextStyle(fontSize: 13),
    bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w100),
    button: TextStyle(fontSize: 14),
    overline: TextStyle(fontSize: 16, letterSpacing: 0),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
    labelStyle: const TextStyle(color: themeColor),
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
  }),
);
