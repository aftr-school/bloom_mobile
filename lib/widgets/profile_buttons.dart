import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/auth.dart';

class ProfileButtons extends StatelessWidget {
  final VoidCallback stateChange;

  const ProfileButtons({Key? key, required this.stateChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () =>
                Get.toNamed('add-product')?.then((_) => stateChange()),
            style: ElevatedButton.styleFrom(
              enableFeedback: false,
              primary: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              'Add Product',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
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
        ],
      ),
    );
  }
}
