import 'package:mini_chat_app/models/chat_history_models.dart';

final List<ChatHistoryItem> chatHistoryList = [
  ChatHistoryItem(
    userName: 'Rahul',
    lastMessage: 'Hey, are you coming today?',
    time: DateTime.now().subtract(const Duration(minutes: 2)),
  ),
  ChatHistoryItem(
    userName: 'Akhil',
    lastMessage: 'Project update sent.',
    time: DateTime.now().subtract(const Duration(minutes: 15)),
  ),
  ChatHistoryItem(
    userName: 'Anu',
    lastMessage: 'Let’s catch up in the evening.',
    time: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  ChatHistoryItem(
    userName: 'Vishnu',
    lastMessage: 'Can you review my PR?',
    time: DateTime.now().subtract(const Duration(hours: 3)),
  ),
  ChatHistoryItem(
    userName: 'Sreejith',
    lastMessage: 'Meeting postponed to tomorrow.',
    time: DateTime.now().subtract(const Duration(hours: 5)),
  ),
  ChatHistoryItem(
    userName: 'Neha',
    lastMessage: 'Thanks for the help!',
    time: DateTime.now().subtract(const Duration(hours: 8)),
  ),
  ChatHistoryItem(
    userName: 'Arjun',
    lastMessage: 'On the way.',
    time: DateTime.now().subtract(const Duration(days: 1)),
  ),
  ChatHistoryItem(
    userName: 'Meera',
    lastMessage: 'Sent the documents.',
    time: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
  ),
  ChatHistoryItem(
    userName: 'Kiran',
    lastMessage: 'Let me know once you’re free.',
    time: DateTime.now().subtract(const Duration(days: 2)),
  ),
  ChatHistoryItem(
    userName: 'Pooja',
    lastMessage: 'Good night 😊',
    time: DateTime.now().subtract(const Duration(days: 3)),
  ),
];
