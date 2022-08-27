import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'navigations/bottom_navbar.dart';
import 'screens/chat.dart';
import 'screens/login.dart';
import 'screens/product_detail.dart';
import 'screens/splashscreen.dart';
import 'screens/transaction.dart';
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
        GetPage(name: '/', page: () => const BottomNavbar()),
        GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
        GetPage(name: LoginPage.routeName, page: () => const LoginPage()),
        GetPage(name: Chat.routName, page: () => const Chat()),
        GetPage(
            name: ProductDetail.routeName, page: () => const ProductDetail()),
        GetPage(name: Transaction.routName, page: () => const Transaction()),
      ],
    );
  }
}
