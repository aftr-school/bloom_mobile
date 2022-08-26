import 'package:flutter/material.dart';

import '../widgets/chat_bubble.dart';
import '../widgets/chat_input.dart';

class Chat extends StatelessWidget {
  static const String routName = '/chat';

  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              enableFeedback: false,
              onPressed: () => Navigator.pop(context),
              splashRadius: 20,
            ),
            const CircleAvatar(
              foregroundImage: NetworkImage(
                  'https://cdn.discordapp.com/avatars/310329118866669570/b7dd8af23d5d94b36197a96b5fbb3349.png?size=4096'),
            ),
          ],
        ),
        title: const Text('Someone'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              reverse: true,
              itemBuilder: (context, index) => const ChatBubble(),
              itemCount: 10,
            ),
          ),
          const ChatInput(),
        ],
      ),
    );
  }
}
