import 'package:cloud_firestore/cloud_firestore.dart';

class TokenService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<int> fetchUserTokens(String userId) async {
    DocumentSnapshot snapshot =
    await _firestore.collection('users').doc(userId).get();

    if (snapshot.exists) {
      return snapshot['tokens'] ?? 0;
    }
    return 0;
  }

  Future<void> updateUserTokens(String userId, int tokens) async {
    await _firestore.collection('users').doc(userId).update({
      'tokens': tokens,
    });
  }
}
