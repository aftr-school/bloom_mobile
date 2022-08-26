import 'package:flutter/material.dart';

import 'navigations/bottom_navbar.dart';
import 'screens/chat.dart';
import 'themes/dark_theme.dart';
import 'themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloom',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      routes: {
        '/': (context) => const BottomNavbar(),
        Chat.routName: (context) => const Chat()
      },
    );
  }
}
