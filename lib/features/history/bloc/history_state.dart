import 'package:mini_chat_app/constants/chat.dart';
import 'package:mini_chat_app/models/chat_history_models.dart';

class ChatHistoryState {
  final List<ChatHistoryItem> chats;
  const ChatHistoryState({required this.chats});

  ChatHistoryState copyWith({List<ChatHistoryItem>? chats}) {
    return ChatHistoryState(chats: chatHistoryList);
  }
}
