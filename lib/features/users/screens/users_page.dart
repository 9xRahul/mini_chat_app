import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/constants/users.dart';
import 'package:mini_chat_app/features/chat/screens/chat_history_page.dart';
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
          // 🔹 Items BEFORE the list
          UsersChatToggle(),

          const Divider(height: 1),

          // 🔹 Chat/User list
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
                            leading: CircleAvatar(
                              child: Text(user.userName[0].toUpperCase()),
                            ),
                            title: Text(user.userName),
                            subtitle: Text(lastSeenText(user.time)),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ChatHistoryPage(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddUserDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
