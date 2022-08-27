import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final data;
  const ProfileHeader({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CircleAvatar(
            foregroundImage: NetworkImage(
              'https://cdn.discordapp.com/avatars/465403883469012992/5563a3e6e43b50faa73908868c66efad.png?size=4096',
            ),
            radius: 46,
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  data['name'],
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).colorScheme.secondary,
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    splashFactory: NoSplash.splashFactory,
                    enableFeedback: true,
                  ),
                  child: Text(
                    data['address']['address'],
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
