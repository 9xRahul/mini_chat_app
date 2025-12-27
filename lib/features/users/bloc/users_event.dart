abstract class UsersEvent {}

class AddUserEvent extends UsersEvent {
  final String name;
  AddUserEvent(this.name);
}

class ChangePageEvent extends UsersEvent {
  final bool isUsers;

  ChangePageEvent(this.isUsers);
}

class HideTopToggle extends UsersEvent {}

class ShowTopToggle extends UsersEvent {}
