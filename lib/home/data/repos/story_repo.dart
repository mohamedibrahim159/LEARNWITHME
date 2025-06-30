import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:learnwithme/home/presentation/models/story_model.dart';

class StoriesRepo {
  Future<List<StoryModel>> fetchStories() async {
    final String response = await rootBundle.loadString(
      'assets/json/stories.json',
    );
    final List<dynamic> data = json.decode(response);
    return data.map((json) => StoryModel.fromJson(json)).toList();
  }
}
