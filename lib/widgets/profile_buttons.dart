import 'package:flutter/material.dart';

import '../services/auth.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () => AuthService().logoutService(),
        style: ElevatedButton.styleFrom(
          enableFeedback: false,
          primary: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
