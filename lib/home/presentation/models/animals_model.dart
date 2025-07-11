class AnimalsModel {
  final int animalId;
  final int categoryId;
  final String animalName;
  final String audioUrl;
  final String photoUrl;
  final dynamic category;

  AnimalsModel({
    required this.animalId,
    required this.categoryId,
    required this.animalName,
    required this.audioUrl,
    required this.photoUrl,
    this.category,
  });

  factory AnimalsModel.fromJson(Map<String, dynamic> json) {
    return AnimalsModel(
      animalId: json['animal_id'],
      categoryId: json['category_id'],
      animalName: json['animal_name'],
      audioUrl: json['audio_url'],
      photoUrl: json['photo_url'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'animal_id': animalId,
      'category_id': categoryId,
      'animal_name': animalName,
      'audio_url': audioUrl,
      'photo_url': photoUrl,
      'category': category,
    };
  }
}
