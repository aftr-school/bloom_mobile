import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/auth.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await AuthService().loginService(
        Login(
          username: usernameController.text,
          password: passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  child: const Text(
                    "Please Sign in to continue",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
                loginForm()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loginForm() {
    return Form(
      key: _formKey,
      child: Wrap(
        runSpacing: 16,
        children: [
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
              hintText: 'username',
              contentPadding: const EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: 'Password',
              contentPadding: const EdgeInsets.only(left: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            style: Theme.of(context).textTheme.labelMedium,
            obscureText: true,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                enableFeedback: false,
                primary: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: handleSubmit,
              child: const Text(
                "Sign in",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () => Get.toNamed('register'),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              splashFactory: NoSplash.splashFactory,
              enableFeedback: false,
            ),
            child: const Text(
              "Register here",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}
