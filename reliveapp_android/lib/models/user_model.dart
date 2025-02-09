import 'transaction_model.dart';

class User {
  final String userId;
  final String name;
  final String email;
  final int tokens;
  final List<Transaction> transactions;
  final Map<String, dynamic> impactStats;

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.tokens,
    required this.transactions,
    required this.impactStats,
  });

  // Factory method to create a User object from Firebase data
  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      userId: data['userId'] ?? '',
      name: data['name'] ?? 'Unknown',
      email: data['email'] ?? '',
      tokens: data['tokens'] ?? 0,
      transactions: (data['transactions'] as List<dynamic>? ?? [])
          .map((e) => Transaction.fromMap(e as Map<String, dynamic>))
          .toList(),
      impactStats: data['impactStats'] ?? {},
    );
  }

  // Convert User object to a map
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'tokens': tokens,
      'transactions': transactions.map((e) => e.toMap()).toList(),
      'impactStats': impactStats,
    };
  }
}
