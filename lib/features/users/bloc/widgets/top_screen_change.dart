import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/features/users/bloc/users_bloc.dart';
import 'package:mini_chat_app/features/users/bloc/users_event.dart';
import 'package:mini_chat_app/features/users/bloc/users_state.dart';

class UsersChatToggle extends StatelessWidget {
  const UsersChatToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
          child: Container(
            height: 40,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                _tab(
                  context,
                  label: 'Users',
                  isSelected: state.isUsers,
                  onTap: () {
                    context.read<UsersBloc>().add(ChangePageEvent(true));
                  },
                ),
                _tab(
                  context,
                  label: 'Chat History',
                  isSelected: !state.isUsers,
                  onTap: () {
                    context.read<UsersBloc>().add(ChangePageEvent(false));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _tab(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.black : Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}
