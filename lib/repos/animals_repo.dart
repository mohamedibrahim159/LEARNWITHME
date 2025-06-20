import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:learnwithme/models/animals_model.dart';

class AnimalsRepo {
  // تحميل كل الحيوانات من ملف JSON المحلي
  static Future<List<AnimalsModel>> fetchAnimals() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/json/animals.json',
      );

      if (response.trim().isEmpty) {
        throw Exception('JSON file is empty.');
      }

      final List<dynamic> data = json.decode(response);

      if (data is! List) {
        throw Exception('Invalid JSON format: expected a list.');
      }

      return data.map((json) => AnimalsModel.fromJson(json)).toList();
    } catch (e) {
      print('❌ Error loading animals: $e');
      return [];
    }
  }

  // جلب حيوان معين بالـ ID من البيانات المحلية
  static Future<AnimalsModel?> fetchAnimalById(int id) async {
    try {
      final animals = await fetchAnimals();
      try {
        return animals.firstWhere((animal) => animal.animalId == id);
      } catch (e) {
        // Return null if no animal is found
        return null;
      }
    } catch (e) {
      print('❌ Error finding animal by ID: $e');
      return null;
    }
  }
}
