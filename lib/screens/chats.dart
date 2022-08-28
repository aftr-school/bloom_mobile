import 'package:flutter/material.dart';

import '../widgets/chats_item.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => ChatsItem(
        name: 'Someone',
        lastMessage: 'i love you <3',
        time: DateTime.now(),
        avatar:
            'https://cdn.discordapp.com/avatars/310329118866669570/b7dd8af23d5d94b36197a96b5fbb3349.png?size=4096',
      ),
      itemCount: 10,
    );
  }
}
