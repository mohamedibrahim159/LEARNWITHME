class StoryModel {
  final int storyId;
  final int categoryId;
  final String title;
  final String videoUrl;
  final String photoUrl;
  final dynamic category;

  StoryModel({
    required this.storyId,
    required this.categoryId,
    required this.title,
    required this.videoUrl,
    required this.photoUrl,
    this.category,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      storyId: json['story_id'],
      categoryId: json['category_id'],
      title: json['title'],
      videoUrl: json['video_url'],
      photoUrl: json['photo_url'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'story_id': storyId,
      'category_id': categoryId,
      'title': title,
      'video_url': videoUrl,
      'photo_url': photoUrl,
      'category': category,
    };
  }
}
