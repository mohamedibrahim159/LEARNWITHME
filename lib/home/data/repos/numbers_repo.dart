import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:learnwithme/home/presentation/models/numbers_model.dart';

class NumbersRepo {
  Future<List<NumberModel>> fetchNumbers() async {
    final String response = await rootBundle.loadString(
      'assets/json/numbers.json',
    );
    final List<dynamic> data = json.decode(response);
    return data.map((json) => NumberModel.fromJson(json)).toList();
  }
}
