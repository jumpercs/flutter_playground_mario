import 'package:flutter/material.dart';
import 'package:flutter_playground_mario/src/atoms/chat_atom.dart';
import 'package:flutter_playground_mario/src/models/chat_model.dart';
import 'package:flutter_playground_mario/src/widgets/chat_bubble.dart';
import 'package:flutter_playground_mario/src/widgets/chat_field.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  void _sendMessage(String message) {
    sendMessageAction.value = message;
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => [chatsState.value, chatLoading.value]);
    final chatModels = chatsState.value;
    final isLoading = chatLoading.value;
    return Scaffold(
        appBar: AppBar(
          title: const Text('GêPêTô'),
        ),
        body: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.black54,
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.only(
              bottom: 80,
            ),
            itemCount: chatModels.length,
            itemBuilder: (context, index) {
              final chatModel = chatModels[index];
              return ChatBubble(chatModel: chatModel);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ChatField(
              onMessage: _sendMessage,
            ),
          ),
          if (isLoading == true)
            const Align(
                alignment: Alignment.bottomCenter,
                child: LinearProgressIndicator())
        ]));
  }
}
