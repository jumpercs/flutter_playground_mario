import 'package:flutter/material.dart';

class ChatField extends StatefulWidget {
  const ChatField(
      {super.key, required this.onMessage, this.sendEnabled = true});

  final bool sendEnabled;
  final void Function(String message) onMessage;

  @override
  State<ChatField> createState() => _ChatFieldState();
}

class _ChatFieldState extends State<ChatField> {
  final TextEditingController _controller = TextEditingController();
  final focusNode = FocusNode();

  _sendMessage() {
    if (widget.sendEnabled) {
      final message = _controller.text;
      if (message.isNotEmpty) {
        widget.onMessage(message);
        _controller.clear();
      }
    }

    focusNode.requestFocus();
  }

  bool get isButtonEnabled => _controller.text.isNotEmpty && widget.sendEnabled;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: // change by brightness
            Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[900]
                : Colors.white54,
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: focusNode,
              decoration: const InputDecoration(
                hintText: 'Digite uma mensagem',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 5),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return IconButton(
                icon: Icon(
                  Icons.send,
                  color: isButtonEnabled ? Colors.blue : Colors.grey,
                ),
                onPressed: isButtonEnabled ? _sendMessage : null,
              );
            },
          )
        ],
      ),
    );
  }
}
