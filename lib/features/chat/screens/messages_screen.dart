import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mini_chat_app/api/meaning_fetch.dart';
import 'package:mini_chat_app/features/chat/bloc/chat_bloc.dart';
import 'package:mini_chat_app/features/chat/bloc/chat_event.dart';
import 'package:mini_chat_app/features/chat/bloc/chat_state.dart';
import 'package:mini_chat_app/features/users/widget/circleAvatar.dart';
import 'package:mini_chat_app/features/users/widget/convert_time.dart';

class ChatPage extends StatelessWidget {
  final String userName;
  final DateTime lastSeen;

  const ChatPage({super.key, required this.userName, required this.lastSeen});

  @override
  Widget build(BuildContext context) {
    // trigger API call once when page builds
    context.read<ChatBloc>().add(SendMessageEvent());

    //Base time = current time - 10 minutes
    final DateTime baseTime = DateTime.now().subtract(
      const Duration(minutes: 10),
    );

    return Scaffold(
      body: Column(
        children: [
          //   App Bar 
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: SafeArea(
              bottom: false,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        lastSeenText(lastSeen),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Chat Body 
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state.isError) {
                  return const Center(
                    child: Text(
                      'Something went wrong. Please try again.',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }

                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  );
                }

                return ListView.builder(
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final msg = state.messages[index];
                    final DateTime messageTime = baseTime.add(
                      Duration(minutes: index),
                    );

                    return Align(
                      alignment: msg.isSender!
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!msg.isSender!)
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                                top: 10,
                              ),
                              child: circleAvatar(
                                userName,
                                gradientColors: const [
                                  Color(0xFF2196F3),
                                  Color(0xFF7F00FF),
                                ],
                                size: 30,
                              ),
                            ),

                          Flexible(
                            child: Column(
                              crossAxisAlignment: msg.isSender!
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                    msg.isSender! ? 60 : 3,
                                    6,
                                    msg.isSender! ? 3 : 60,
                                    2,
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: msg.isSender!
                                        ? Colors.blue
                                        : Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: SelectableText(
                                    msg.body!,
                                    onSelectionChanged: (selection, cause) {
                                      if (selection.isCollapsed) return;

                                      final selectedWord = msg.body!
                                          .substring(
                                            selection.start,
                                            selection.end,
                                          )
                                          .trim()
                                          .toLowerCase();

                                      if (selectedWord.contains(' ')) return;

                                      MeaningFetch().searchWordMeaning(
                                        context,
                                        selectedWord,
                                      );
                                    },
                                    style: TextStyle(
                                      color: msg.isSender!
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(
                                    right: msg.isSender! ? 6 : 0,
                                    left: msg.isSender! ? 0 : 6,
                                  ),
                                  child: Text(
                                    lastSeenText(messageTime),
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          if (msg.isSender!)
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                                top: 10,
                              ),
                              child: circleAvatar(
                                "X",
                                gradientColors: const [
                                  Color(0xFF2196F3),
                                  Color(0xFFE91E63),
                                ],
                                size: 30,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
