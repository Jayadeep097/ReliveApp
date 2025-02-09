import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/community_stats_model.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // User Authentication
  Future<User?> loginUser(String email, String password) async {
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return result.user;
  }

  Future<void> signupUser(String email, String password, String name) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore.collection('users').doc(result.user!.uid).set({
      'name': name,
      'email': email,
    });
  }

  // Fetch Projects
  Future<List<Map<String, dynamic>>> fetchAllProjects() async {
    QuerySnapshot snapshot = await _firestore.collection('projects').get();
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

// Fetch Community Stats
  Future<List<CommunityStats>> fetchCommunityStats() async {
    try {
      final snapshot = await _firestore.collection('communityStats').get();
      return snapshot.docs.map((doc) {
        return CommunityStats.fromMap(
            doc.data(), doc.id);
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch community stats: $e');
    }
  }
}
