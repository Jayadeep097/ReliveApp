class ProjectModel {
  final String id;
  final String name;
  final String description;
  final double fundsRaised;
  final List<String> contributors;

  ProjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.fundsRaised,
    required this.contributors,
  });

  // Convert Firestore data to a ProjectModel object
  factory ProjectModel.fromMap(Map<String, dynamic> data, String id) {
    return ProjectModel(
      id: id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      fundsRaised: (data['fundsRaised'] ?? 0).toDouble(),
      contributors: List<String>.from(data['contributors'] ?? []),
    );
  }

  // Convert ProjectModel object to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'fundsRaised': fundsRaised,
      'contributors': contributors,
    };
  }
}
