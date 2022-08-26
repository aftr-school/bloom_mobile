import 'package:flutter/material.dart';

import '../widgets/profile_header.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ProfileHeader(),
        Container(
          margin: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).colorScheme.secondary,
            ),
            child: const Text('Edit Profile'),
          ),
        )
      ],
    );
  }
}
