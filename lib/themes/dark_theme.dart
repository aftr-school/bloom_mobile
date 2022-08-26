import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: Color.fromRGBO(18, 18, 18, 1),
    secondary: Colors.teal,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  canvasColor: const Color.fromRGBO(18, 18, 18, 1),
  cardTheme: const CardTheme(color: Color.fromRGBO(24, 24, 24, 1)),
  fontFamily: 'NotoSansJP',
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.teal,
    selectionColor: Colors.teal,
    selectionHandleColor: Colors.teal,
  ),
  textTheme: const TextTheme(
    caption: TextStyle(height: 1.5),
    subtitle2: TextStyle(color: Colors.white70),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(color: Colors.teal),
  ),
);
