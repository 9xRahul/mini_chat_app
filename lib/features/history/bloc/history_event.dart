import 'package:mini_chat_app/features/history/bloc/history_state.dart';
import 'package:mini_chat_app/models/chat_history_models.dart';

abstract class ChatHistoryEvent {}

class UpdateChatHistoryEvent extends ChatHistoryEvent {
  final ChatHistoryItem item;
  UpdateChatHistoryEvent(this.item);
}
