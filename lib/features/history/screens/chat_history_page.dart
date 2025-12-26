import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/features/history/bloc/history_bloc.dart';
import 'package:mini_chat_app/features/history/bloc/history_state.dart';
import 'package:mini_chat_app/features/users/widget/convert_time.dart';

class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatHistoryBloc, ChatHistoryState>(
      builder: (context, state) {
        return ListView.builder(
          key: const PageStorageKey('chat_history'),
          itemCount: state.chats.length,
          itemBuilder: (context, index) {
            final chat = state.chats[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(chat.userName[0].toUpperCase()),
              ),
              title: Text(chat.userName),
              subtitle: Text(chat.lastMessage),
              trailing: Text(lastSeenText(chat.time)),
            );
          },
        );
      },
    );
  }
}
