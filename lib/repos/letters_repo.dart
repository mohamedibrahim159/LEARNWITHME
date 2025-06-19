import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:learnwithme/models/letters_model.dart';

class LettersRepo {
  Future<List<LettersModel>> fetchLetters() async {
    final String response = await rootBundle.loadString(
      'assets/json/letters.json',
    );
    final List<dynamic> data = json.decode(response);
    return data.map((json) => LettersModel.fromJson(json)).toList();
  }
}
