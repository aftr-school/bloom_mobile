import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Write a message',
                filled: true,
                fillColor: Theme.of(context).cardTheme.color,
                isDense: true,
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16),
                ),
                suffixIcon: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {},
                    splashRadius: 24,
                    icon: const Icon(
                      Icons.attach_file,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            enableFeedback: false,
            icon: const Icon(Icons.send_rounded),
            color: Theme.of(context).colorScheme.secondary,
          )
        ],
      ),
    );
  }
}
