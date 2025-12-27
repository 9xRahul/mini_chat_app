import 'package:mini_chat_app/models/user_model.dart';

final now = DateTime.now();

final List<UserModel> users = [
  UserModel(
    userName: 'Rahul',
    time: now, // now
  ),
  UserModel(
    userName: 'Anu',
    time: now.subtract(const Duration(minutes: 1)), // 1 min ago
  ),
  UserModel(
    userName: 'Vishnu',
    time: now.subtract(const Duration(minutes: 2)), // 2 min ago
  ),
  UserModel(
    userName: 'Meera',
    time: now, // 5 min ago
  ),
  UserModel(
    userName: 'Arjun',
    time: now.subtract(const Duration(minutes: 10)), // 10 min ago
  ),
  UserModel(
    userName: 'Sneha',
    time: now.subtract(const Duration(hours: 1)), // 1 hr ago
  ),
  UserModel(
    userName: 'Kiran',
    time: now, // 2 hrs ago
  ),
  UserModel(
    userName: 'Neethu',
    time: now.subtract(const Duration(hours: 5)), // 5 hrs ago
  ),
  UserModel(
    userName: 'Akhil',
    time: now.subtract(const Duration(days: 1)), // 1 day ago
  ),
  UserModel(
    userName: 'Sandeep',
    time: now.subtract(const Duration(days: 2)), // 2 days ago
  ),
  UserModel(
    userName: 'Vishnu',
    time: now.subtract(const Duration(minutes: 2)), // 2 min ago
  ),
  UserModel(
    userName: 'Meera',
    time: now, // 5 min ago
  ),
  UserModel(
    userName: 'Arjun',
    time: now.subtract(const Duration(minutes: 10)), // 10 min ago
  ),
  UserModel(
    userName: 'Sneha',
    time: now.subtract(const Duration(hours: 1)), // 1 hr ago
  ),
  UserModel(
    userName: 'Kiran',
    time: now, // 2 hrs ago
  ),
  UserModel(
    userName: 'Neethu',
    time: now.subtract(const Duration(hours: 5)), // 5 hrs ago
  ),
  UserModel(
    userName: 'Vishnu',
    time: now.subtract(const Duration(minutes: 2)), // 2 min ago
  ),
  UserModel(
    userName: 'Meera',
    time: now, // 5 min ago
  ),
  UserModel(
    userName: 'Arjun',
    time: now.subtract(const Duration(minutes: 10)), // 10 min ago
  ),
  UserModel(
    userName: 'Sneha',
    time: now.subtract(const Duration(hours: 1)), // 1 hr ago
  ),
  UserModel(
    userName: 'Kiran',
    time: now, // 2 hrs ago
  ),
  UserModel(
    userName: 'Neethu',
    time: now.subtract(const Duration(hours: 5)), // 5 hrs ago
  ),
];
