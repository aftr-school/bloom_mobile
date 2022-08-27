import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  GetStorage storage = GetStorage();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      storage.hasData('token') ? Get.offNamed('/') : Get.offNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Bloom',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, letterSpacing: 2.0),
            ),
          ],
        ),
      ),
    );
  }
}
