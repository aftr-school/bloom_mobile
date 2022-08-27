import 'package:flutter/material.dart';

import 'profile_grid_item.dart';

class ProfileGrid extends StatelessWidget {
  const ProfileGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 240,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: ((context, index) => const ProfileGridItem()),
        itemCount: 10,
      ),
    );
  }
}
