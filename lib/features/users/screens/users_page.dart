import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/constants/users.dart';
import 'package:mini_chat_app/features/history/screens/chat_history_page.dart';
import 'package:mini_chat_app/features/chat/screens/messages_screen.dart';
import 'package:mini_chat_app/features/users/bloc/widgets/floatingActionButton.dart';
import 'package:mini_chat_app/features/users/bloc/widgets/top_screen_change.dart';
import 'package:mini_chat_app/features/users/widget/add_user_dialouge.dart';
import 'package:mini_chat_app/features/users/widget/circleAvatar.dart';
import 'package:mini_chat_app/features/users/widget/convert_time.dart';
import '../bloc/users_bloc.dart';
import '../bloc/users_event.dart';
import '../bloc/users_state.dart';
import 'package:mini_chat_app/models/user_model.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              if (!state.showTopToggle) {
                return const SizedBox.shrink();
              }
              return Column(
                children: [UsersChatToggle(), const Divider(height: 1)],
              );
            },
          ),

          //  User list
          BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              return Expanded(
                child: state.isUsers
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (notification) {
                            if (notification is UserScrollNotification) {
                              if (notification.direction ==
                                  ScrollDirection.reverse) {
                                context.read<UsersBloc>().add(HideTopToggle());
                              } else if (notification.direction ==
                                      ScrollDirection.forward &&
                                  notification.metrics.pixels <= 0) {
                                context.read<UsersBloc>().add(ShowTopToggle());
                              }
                            }
                            return false;
                          },
                          child: ListView.builder(
                            key: const PageStorageKey('users_list'),
                            itemCount: state.users.length,
                            itemBuilder: (context, index) {
                              final user = state.users[index];
                              return ListTile(
                                leading: Stack(
                                  children: [
                                    circleAvatar(
                                      user.userName,
                                      gradientColors: const [
                                        Color(0xFF2196F3),
                                        Color(0xFF7F00FF),
                                      ],
                                      size: 48,
                                    ),

                                    // 🟢 Online indicator
                                    if (user.time.isAfter(
                                      DateTime.now().subtract(
                                        const Duration(minutes: 1),
                                      ),
                                    ))
                                      Positioned(
                                        right: 2,
                                        bottom: 2,
                                        child: Container(
                                          width: 12,
                                          height: 12,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                title: Text(user.userName),
                                subtitle: Text(lastSeenText(user.time)),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ChatPage(
                                        userName: user.userName,
                                        lastSeen: user.time,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      )
                    : const ChatHistoryPage(),
              );
            },
          ),
        ],
      ),
      floatingActionButton: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (!state.isUsers) return const SizedBox.shrink();

          return floatingActionButton(context);
        },
      ),
    );
  }
}
