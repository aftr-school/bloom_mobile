import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  static const String routName = '/chat';

  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          enableFeedback: false,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Someone'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => const Text('ok'),
            ),
          ),
          const Text('Input Text'),
        ],
      ),
    );
  }
}
