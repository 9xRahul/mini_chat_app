import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/features/chat/chat_history_page.dart';
import 'package:mini_chat_app/features/users/widget/add_user_dialouge.dart';
import '../bloc/users_bloc.dart';
import '../bloc/users_event.dart';
import '../bloc/users_state.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        return Scaffold(
          body: ListView.builder(
            key: const PageStorageKey('users_list'),
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              final name = state.users[index];
              return ListTile(
                leading: CircleAvatar(child: Text(name[0].toUpperCase())),
                title: Text(name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ChatHistoryPage()),
                  );
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showAddUserDialog(context);
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
