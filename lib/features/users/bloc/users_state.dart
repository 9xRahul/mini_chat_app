import 'package:mini_chat_app/models/user_model.dart';

class UsersState {
  final List<UserModel> users;
  final bool isUsers;
  final bool showTopToggle;
  
  const UsersState({
    required this.users,
    this.isUsers = true,
    this.showTopToggle = true,
  });

  UsersState copyWith({
    List<UserModel>? users,
    bool? isUsers,
    bool? showTopToggle,
  }) {
    return UsersState(
      users: users ?? this.users,
      isUsers: isUsers ?? this.isUsers,
      showTopToggle: showTopToggle ?? this.showTopToggle,
    );
  }
}
