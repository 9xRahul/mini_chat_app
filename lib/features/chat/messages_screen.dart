import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/features/chat/bloc/chat_bloc.dart';
import 'package:mini_chat_app/features/chat/bloc/chat_event.dart';
import 'package:mini_chat_app/features/chat/bloc/chat_state.dart';

class ChatPage extends StatelessWidget {
  final String userName;

  const ChatPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    // trigger API call once when page builds
    context.read<ChatBloc>().add(SendMessageEvent());

    return Scaffold(
      appBar: AppBar(title: Text(userName)),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                // ERROR STATE
                if (state.isError) {
                  return Center(
                    child: Text(
                      'Something went wrong. Please try again.',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  );
                }

                // SUCCESS STATE
                return ListView.builder(
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final msg = state.messages[index];

                    return Align(
                      alignment: msg.isSender!
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: msg.isSender!
                              ? Colors.blue
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          msg.body!,
                          style: TextStyle(
                            color: msg.isSender! ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // ---- Input section (kept commented as requested) ----
          /*
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      context.read<ChatBloc>().add(
                        SendMessageEvent(_controller.text, true),
                      );
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          */
        ],
      ),
    );
  }
}
