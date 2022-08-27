import 'package:flutter/material.dart';

import '../services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await AuthService().loginService(Login(
        username: usernameController.text,
        password: passwordController.text,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 180, left: 20, right: 20),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all((25)),
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: const Text(
                    "Please Sign in to continue",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
                loginForm()
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  Widget loginForm() {
    return Form(
      key: _formKey,
      child: Wrap(
        runSpacing: 20,
        children: <Widget>[
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.only(left: 10),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              hintText: 'username',
            ),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.only(left: 10),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              hintText: 'Password',
            ),
            style: Theme.of(context).textTheme.labelMedium,
            obscureText: true,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
                primary: Theme.of(context).colorScheme.secondary,
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
        ],
      ),
    );
  }
}
