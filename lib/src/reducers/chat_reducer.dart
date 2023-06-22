import 'dart:async';
import 'dart:convert';

import 'package:flutter_playground_mario/src/atoms/chat_atom.dart';
import 'package:flutter_playground_mario/src/common/constants.dart';
import 'package:flutter_playground_mario/src/models/chat_model.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:http/http.dart' as http;

class ChatReducer extends RxReducer {
  late final chatGpt = ChatGpt(apiKey: apiKey);

  ChatReducer() {
    on(() => [sendMessageAction], sendMessage);
  }

  void sendMessage() async {
    final message = sendMessageAction.value;

    if (message.isEmpty) {
      return;
    }

    chatLoading.value = true;

    List<Message> chats = [];

    for (var chat in chatsState.value) {
      chats.add(Message(
          role: chat.isSender ? Role.user.name : Role.assistant.name,
          content: chat.text));
    }

    chatsState.value.add(ChatModel(text: message, isSender: true));
    chatsState();
    // a list of messages to send to the API

    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer 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'
    };
    var request = http.Request(
        'POST', Uri.parse('https://api.openai.com/v1/chat/completions'));
    request.body = json.encode({
      "model": "gpt-3.5-turbo",
      "messages": [
        ...chats.map((e) => {"role": e.role, "content": e.content}).toList(),
        {"role": "user", "content": message}
      ]
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var jsonRes = json.decode(data);
      var choices = jsonRes['choices'][0];
      var hhh = choices['message'];
      var text = hhh['content'];
      chatsState.value.add(ChatModel(text: text, isSender: false));
      chatsState();
    } else {
      print(response.statusCode);
    }
    chatLoading.value = false;
    chatsState();
  }
}
