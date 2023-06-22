import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playground_mario/src/models/chat_model.dart';

class ChatBubble extends StatelessWidget {
  final ChatModel chatModel;

  const ChatBubble({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    if (chatModel.isSender) {
      return InkWell(
        onLongPress: () async {
          //copy text to clipboard

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Texto copiado para a área de transferência'),
            ),
          );
          await Clipboard.setData(ClipboardData(text: chatModel.text));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BubbleSpecialOne(
              text: chatModel.text,
              textStyle: const TextStyle(color: Colors.white),
              isSender: chatModel.isSender,
              color: //075E54
                  const Color.fromARGB(255, 7, 94, 84),
              tail: true,
            ),
          ],
        ),
      );
    } else {
      return InkWell(
        onLongPress: () async {
          //copy text to clipboard

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Texto copiado para a área de transferência'),
            ),
          );
          await Clipboard.setData(ClipboardData(text: chatModel.text));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BubbleSpecialOne(
              text: chatModel.text,
              textStyle: const TextStyle(color: Colors.white),
              isSender: chatModel.isSender,
              color: const Color.fromARGB(255, 43, 45, 46),
              tail: true,
            ),
          ],
        ),
      );
    }
  }
}
