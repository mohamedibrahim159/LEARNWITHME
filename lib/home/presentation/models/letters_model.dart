class LettersModel {
  final int letterId;
  final int categoryId;
  final String letter;
  final String? audioUrl;
  final String photoUrl;
  final dynamic category;

  LettersModel({
    required this.letterId,
    required this.categoryId,
    required this.letter,
    this.audioUrl,
    required this.photoUrl,
    this.category,
  });

  factory LettersModel.fromJson(Map<String, dynamic> json) {
    return LettersModel(
      letterId: json['letter_id'],
      categoryId: json['category_id'],
      letter: json['letter'],
      audioUrl: json['audio_url'],
      photoUrl: json['photo_url'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'letter_id': letterId,
      'category_id': categoryId,
      'letter': letter,
      'audio_url': audioUrl,
      'photo_url': photoUrl,
      'category': category,
    };
  }
}
