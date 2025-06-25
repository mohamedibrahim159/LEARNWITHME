import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:learnwithme/models/letters_model.dart';

class LettersRepo {
  static Future<List<LettersModel>> fetchAllLetters() async {
    final String response = await rootBundle.loadString(
      'assets/json/letters.json',
    );
    final List<dynamic> data = json.decode(response);
    return data.map((json) => LettersModel.fromJson(json)).toList();
  }

  static Future<LettersModel?> fetchLetterById(int id) async {
    final String response = await rootBundle.loadString(
      'assets/json/letters_details.json',
    );
    final List<dynamic> data = json.decode(response);
    final List<LettersModel> letters =
        data.map((json) => LettersModel.fromJson(json)).toList();
    // final letters = await fetchLetters();
    try {
      return letters.firstWhere((letter) => letter.letterId == id);
    } catch (e) {
      // Return null if no letter is found
      return null;
    }
  }
}
