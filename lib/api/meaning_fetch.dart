import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MeaningFetch {
  Future<void> searchWordMeaning(BuildContext context, String word) async {
    final url = Uri.parse(
      'https://api.dictionaryapi.dev/api/v2/entries/en/$word',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final meaning = data[0]['meanings'][0]['definitions'][0]['definition'];

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '$word: $meaning',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            duration: const Duration(seconds: 4),
          ),
        );
      } else {
        throw Exception();
      }
    } catch (_) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No meaning found for "$word"')));
    }
  }
}
