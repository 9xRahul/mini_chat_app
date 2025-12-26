import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/constants/users.dart';
import 'package:mini_chat_app/features/history/screens/chat_history_page.dart';
import 'package:mini_chat_app/features/chat/messages_screen.dart';
import 'package:mini_chat_app/features/users/bloc/widgets/top_screen_change.dart';
import 'package:mini_chat_app/features/users/widget/add_user_dialouge.dart';
import 'package:mini_chat_app/features/users/widget/convert_time.dart';
import '../bloc/users_bloc.dart';
import '../bloc/users_event.dart';
import '../bloc/users_state.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UsersChatToggle(),

          const Divider(height: 1),

          //  User list
          BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              return Expanded(
                child: state.isUsers
                    ? ListView.builder(
                        key: const PageStorageKey('users_list'),
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          final user = state.users[index];
                          return ListTile(
                            leading: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.blue,
                                  child: Text(user.userName[0].toUpperCase()),
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
                                  builder: (_) =>
                                      ChatPage(userName: user.userName),
                                ),
                              );
                            },
                          );
                        },
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

          return FloatingActionButton(
            onPressed: () {
              showAddUserDialog(context);
            },
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
