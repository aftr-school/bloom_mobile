import 'package:flutter/material.dart';

import '../services/product.dart';
import '../services/user.dart';
import '../widgets/profile_buttons.dart';
import '../widgets/profile_grid.dart';
import '../widgets/profile_header.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  // var data;

  void _stateChange() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        FutureBuilder(
          future: UserService().get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  ProfileHeader(data: snapshot.data),
                  ProfileButtons(stateChange: _stateChange),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
        FutureBuilder(
          future: ProductService().get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  ProfileGrid(data: snapshot.data),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        )
      ],
    );
  }
}
