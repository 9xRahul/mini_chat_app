import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/constants/chat.dart';
import 'package:mini_chat_app/features/history/bloc/history_event.dart';
import 'package:mini_chat_app/features/history/bloc/history_state.dart';
import 'package:mini_chat_app/models/chat_history_models.dart';

class ChatHistoryBloc extends Bloc<ChatHistoryEvent, ChatHistoryState> {
  ChatHistoryBloc() : super(ChatHistoryState(chats: chatHistoryList)) {
    on<UpdateChatHistoryEvent>((event, emit) {
      // final updated = List<ChatHistoryItem>.from(state.chats);
      // updated.removeWhere((e) => e.userName == event.item.userName);
      // updated.insert(0, event.item);
      emit(state.copyWith(chats: chatHistoryList));
    });
  }
}
