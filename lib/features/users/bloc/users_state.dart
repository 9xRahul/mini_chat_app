import 'package:mini_chat_app/models/user_model.dart';

class UsersState {
  final List<UserModel> users;
  final bool isUsers;
  const UsersState({required this.users, this.isUsers = true});

  UsersState copyWith({List<UserModel>? users, bool? isUsers}) {
    return UsersState(
      users: users ?? this.users,
      isUsers: isUsers ?? this.isUsers,
    );
  }
}
