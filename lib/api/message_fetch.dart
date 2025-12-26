import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mini_chat_app/models/message.dart';

class MessageApi {
  Future<Map<String, dynamic>> fetchMessages() async {
    Map<String, dynamic> result = {
      "messages": <Message>[],
      "isError": false,
      "status": "",
    };

    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments'),
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);

        final messages = data.map<Message>((json) {
          return Message(body: json['body'], isSender: true);
        }).toList();

        result["messages"] = messages;
        result["status"] = "success";
      } else {
        result["isError"] = true;
        result["status"] = "Failed with status ${response.statusCode}";
      }
    } catch (e) {
      result["isError"] = true;
      result["status"] = e.toString();
    }

    return result;
  }
}
