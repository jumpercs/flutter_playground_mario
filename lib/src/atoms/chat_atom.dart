// atoms
import 'package:flutter_playground_mario/src/models/chat_model.dart';
import 'package:rx_notifier/rx_notifier.dart';

final chatsState = RxNotifier<List<ChatModel>>([]);
final chatLoading = RxNotifier<bool>(false);
// action
final sendMessageAction = RxNotifier<String>('');
