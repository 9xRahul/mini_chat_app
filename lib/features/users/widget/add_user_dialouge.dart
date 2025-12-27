import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/features/users/bloc/users_bloc.dart';
import 'package:mini_chat_app/features/users/bloc/users_event.dart';

void showAddUserDialog(BuildContext context) {
  final TextEditingController nameController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Add User'),
        content: TextField(
          controller: nameController,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Enter user name'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final String newUser = nameController.text.trim();

              if (newUser.isNotEmpty) {
                context.read<UsersBloc>().add(AddUserEvent(newUser));

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(' $newUser added')));
              }

              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}
