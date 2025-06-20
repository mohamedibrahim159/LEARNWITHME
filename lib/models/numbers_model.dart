class NumberModel {
  final int numberId;
  final int categoryId;
  final String number;
  final String photoUrl;
  final String audioUrl;
  final dynamic category;

  NumberModel({
    required this.numberId,
    required this.categoryId,
    required this.number,
    required this.photoUrl,
    required this.audioUrl,
    this.category,
  });

  factory NumberModel.fromJson(Map<String, dynamic> json) {
    return NumberModel(
      numberId: json['number_id'],
      categoryId: json['category_id'],
      number: json['number'],
      photoUrl: json['photo_url'],
      audioUrl: json['audio_url'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number_id': numberId,
      'category_id': categoryId,
      'number': number,
      'photo_url': photoUrl,
      'audio_url': audioUrl,
      'category': category,
    };
  }
}
