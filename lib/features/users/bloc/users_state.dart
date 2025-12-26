class UsersState {
  final List<String> users;
  const UsersState({required this.users});

  UsersState copyWith({List<String>? users}) {
    return UsersState(users: users ?? this.users);
  }
}
