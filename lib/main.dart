import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/features/users/bloc/users_bloc.dart';
import 'app.dart';
import 'features/home/bloc/home_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()),
        BlocProvider(create: (_) => UsersBloc()),
        //  BlocProvider(create: (_) => ChatHistoryBloc()),
      ],
      child: const MyApp(),
    ),
  );
}
