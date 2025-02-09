import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/learning_model.dart'; // Correct the import path

class LearningService {
  // Reference to the 'learning' collection in Firestore
  final CollectionReference _learningCollection =
  FirebaseFirestore.instance.collection('learning');

  // Fetch all learning modules from Firestore
  Future<List<LearningModel>> fetchLearningModules() async {
    try {
      QuerySnapshot snapshot = await _learningCollection.get();
      return snapshot.docs.map((doc) {
        return LearningModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch learning modules: $e');
    }
  }

  // Add a new learning module
  Future<void> addLearningModule(LearningModel module) async {
    try {
      await _learningCollection.add(module.toMap());
    } catch (e) {
      throw Exception('Failed to add learning module: $e');
    }
  }

  // Update an existing learning module
  Future<void> updateLearningModule(String moduleId, Map<String, dynamic> updatedData) async {
    try {
      await _learningCollection.doc(moduleId).update(updatedData);
    } catch (e) {
      throw Exception('Failed to update learning module: $e');
    }
  }

  // Delete a learning module
  Future<void> deleteLearningModule(String moduleId) async {
    try {
      await _learningCollection.doc(moduleId).delete();
    } catch (e) {
      throw Exception('Failed to delete learning module: $e');
    }
  }
}
