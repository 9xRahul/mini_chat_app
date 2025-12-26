import 'package:flutter_bloc/flutter_bloc.dart';
import 'users_event.dart';
import 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(const UsersState(users: [])) {
    on<AddUserEvent>((event, emit) {
      final updated = List<String>.from(state.users)..add(event.name);
      emit(state.copyWith(users: updated));
    });
  }
}
