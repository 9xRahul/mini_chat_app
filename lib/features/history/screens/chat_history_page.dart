import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/features/history/bloc/history_bloc.dart';
import 'package:mini_chat_app/features/history/bloc/history_state.dart';
import 'package:mini_chat_app/features/users/bloc/users_bloc.dart';
import 'package:mini_chat_app/features/users/bloc/users_event.dart';
import 'package:mini_chat_app/features/users/widget/circleAvatar.dart';
import 'package:mini_chat_app/features/users/widget/convert_time.dart';

class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatHistoryBloc, ChatHistoryState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is UserScrollNotification) {
                if (notification.direction == ScrollDirection.reverse) {
                  context.read<UsersBloc>().add(HideTopToggle());
                } else if (notification.direction == ScrollDirection.forward &&
                    notification.metrics.pixels <= 0) {
                  context.read<UsersBloc>().add(ShowTopToggle());
                }
              }
              return false;
            },
            child: ListView.builder(
              key: const PageStorageKey('chat_history'),
              itemCount: state.chats.length,
              itemBuilder: (context, index) {
                final chat = state.chats[index];
                return ListTile(
                  leading: circleAvatar(
                    chat.userName,
                    gradientColors: const [
                      Color.fromARGB(255, 2, 248, 105),
                      Color.fromARGB(255, 2, 248, 105),
                    ],
                    size: 48,
                  ),

                  title: Text(chat.userName),
                  subtitle: Text(chat.lastMessage),
                  trailing: Text(lastSeenText(chat.time)),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
