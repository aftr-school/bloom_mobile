import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'screens/splashscreen.dart';
import 'screens/login.dart';

import 'navigations/bottom_navbar.dart';
import 'screens/chat.dart';
import 'screens/product_detail.dart';
import 'themes/dark_theme.dart';
import 'themes/light_theme.dart';

void main() async {
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bloom',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/', page: () => const BottomNavbar()),
        GetPage(name: '/chat', page: () => const Chat()),
        GetPage(name: '/product-detail', page: () => const ProductDetail()),
      ],
    );
  }
}
