import 'package:flutter/material.dart';
import 'package:flutter_playground_mario/src/pages/chat_page.dart';
import 'package:flutter_playground_mario/src/reducers/chat_reducer.dart';
import 'package:flutter_playground_mario/src/widgets/chat_field.dart';
import 'package:rx_notifier/rx_notifier.dart';

final chatReducer = ChatReducer();
void main() {
  chatReducer;
  runApp(const RxRoot(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Playground',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
      ),
      home: const ChatPage(),
    );
  }
}
