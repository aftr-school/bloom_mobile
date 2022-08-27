import 'package:flutter/material.dart';

import '../widgets/profile_buttons.dart';
import '../widgets/profile_grid.dart';
import '../widgets/profile_header.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        ProfileHeader(),
        ProfileButtons(),
        ProfileGrid(),
      ],
    );
  }
}
