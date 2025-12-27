import 'package:flutter/material.dart';
import 'package:mini_chat_app/features/users/widget/add_user_dialouge.dart';

GestureDetector floatingActionButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      showAddUserDialog(context);
    },
    child: Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: const Center(
        child: Text(
          '+',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
