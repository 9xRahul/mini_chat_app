import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/api/message_fetch.dart';
import 'package:mini_chat_app/constants/messages.dart';

import 'package:mini_chat_app/models/message.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState(messages: [])) {
    on<SendMessageEvent>(onSend);
  }

Future<void> onSend(SendMessageEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(isLoading: true, isError: false));

    try {
      final Map<String, dynamic> reply = await MessageApi().fetchMessages();

      // API-level error
      if (reply['isError'] == true) {
        emit(state.copyWith(isLoading: false, isError: true));
        return;
      }

      final List<Message> apiMessages = List<Message>.from(
        reply['messages'] ?? [],
      );

      final List<Message> combinedMessages = [];

      final int length = apiMessages.length < localMessages.length
          ? apiMessages.length
          : localMessages.length;

      for (int i = 0; i < length; i++) {
        combinedMessages.add(apiMessages[i]); // sender = true
        combinedMessages.add(localMessages[i]); // sender = false
      }

      emit(
        state.copyWith(
          isLoading: false,
          messages: combinedMessages,
          isError: false,
        ),
      );
    } catch (e) {
      // Network / parsing / unexpected error
      emit(state.copyWith(isLoading: false, isError: true));
    }
  }

}
