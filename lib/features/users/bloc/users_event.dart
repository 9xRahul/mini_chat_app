abstract class UsersEvent {}

class AddUserEvent extends UsersEvent {
  final String name;
  AddUserEvent(this.name);
}
