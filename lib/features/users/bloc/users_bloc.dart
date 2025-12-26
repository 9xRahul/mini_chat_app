import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/constants/users.dart';
import 'package:mini_chat_app/models/user_model.dart';
import 'users_event.dart';
import 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersState(users: users)) {
    on<AddUserEvent>((event, emit) {
      final newUser = UserModel(
        userName: event.name,
        time: DateTime.now(), // active time = now
      );
      users.add(newUser);
      //final updatedUsers = List<UserModel>.from(state.users)..add(newUser);
      emit(state.copyWith(users: users));
    });

    on<ChangePageEvent>((event, emit) {
      emit(state.copyWith(isUsers: event.isUsers));
    });
  }
}
