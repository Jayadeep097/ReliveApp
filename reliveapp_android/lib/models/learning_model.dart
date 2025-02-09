
class LearningModel {
  final String id;
  final String title;
  final String description;
  final String content;
  final String imageUrl;
  final List<String> tags;

  LearningModel({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.imageUrl,
    required this.tags,
  });

  // Method to create a LearningModel object from Firestore data
  factory LearningModel.fromMap(Map<String, dynamic> data, String documentId) {
    return LearningModel(
      id: documentId,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      content: data['content'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      tags: List<String>.from(data['tags'] ?? []),
    );
  }

  // Method to convert LearningModel to Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'content': content,
      'imageUrl': imageUrl,
      'tags': tags,
    };
  }
}
