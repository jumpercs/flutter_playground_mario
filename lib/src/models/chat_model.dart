// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChatModel {
  final String text;

  final bool isSender;

  ChatModel({
    required this.text,
    this.isSender = true,
  });

  ChatModel copyWith({
    String? text,
    String? uid,
    DateTime? time,
    bool? isSender,
  }) {
    return ChatModel(
      text: text ?? this.text,
      isSender: isSender ?? this.isSender,
    );
  }
}
