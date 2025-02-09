
class ProjectModel {
  final String id;
  final String name;
  final String description;
  final String category;
  final String imageUrl;
  final double fundingGoal;
  final double currentFunding;
  final int impactPoints;

  ProjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.fundingGoal,
    required this.currentFunding,
    required this.impactPoints,
  });

  // Method to create a ProjectModel object from Firestore data
  factory ProjectModel.fromMap(Map<String, dynamic> data, String documentId) {
    return ProjectModel(
      id: documentId,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      category: data['category'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      fundingGoal: (data['fundingGoal'] ?? 0).toDouble(),
      currentFunding: (data['currentFunding'] ?? 0).toDouble(),
      impactPoints: data['impactPoints'] ?? 0,
    );
  }

  // Method to convert ProjectModel to Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'category': category,
      'imageUrl': imageUrl,
      'fundingGoal': fundingGoal,
      'currentFunding': currentFunding,
      'impactPoints': impactPoints,
    };
  }
}
