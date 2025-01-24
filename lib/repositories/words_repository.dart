import 'dart:convert';

import 'package:dio/dio.dart';

class WordRepository {
  Future<List<String>> getWords() async {
    final res = await Dio().get(
        'https://raw.githubusercontent.com/welitonsousa/words/refs/heads/main/words.json');
    final list = jsonDecode(res.data)["words"] as List;
    return list.map((e) => e.toString()).toList();
  }
}
