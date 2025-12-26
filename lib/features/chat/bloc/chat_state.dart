import 'package:mini_chat_app/models/message.dart';

class ChatState {
  final List<Message> messages;
  final bool isLoading;
  final bool isError;
  const ChatState({
    required this.messages,
    this.isLoading = false,
    this.isError = false,
  });

  ChatState copyWith({
    List<Message>? messages,
    bool? isLoading,
    bool? isError,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
    );
  }
}
