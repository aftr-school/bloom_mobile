import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigations/bottom_navbar.dart';
import 'themes/dark_theme.dart';
import 'themes/light_theme.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bloom',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const BottomNavbar()),
      ],
    );
  }
}
