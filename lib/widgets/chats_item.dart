import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../screens/chat.dart';

class ChatsItem extends StatelessWidget {
  final String name;
  final String lastMessage;
  final DateTime time;
  final String avatar;

  const ChatsItem({
    Key? key,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enableFeedback: false,
      onTap: () => Get.toNamed(Chat.routName),
      leading: CircleAvatar(foregroundImage: NetworkImage(avatar)),
      title: Text(name),
      subtitle: Text(lastMessage),
      trailing: Text(DateFormat.Hm().format(time)),
    );
  }
}
