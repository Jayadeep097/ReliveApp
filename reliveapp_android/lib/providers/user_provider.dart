import 'package:flutter/material.dart';

// User model class
class User {
  final String userId;
  final String name;
  final String email;
  final int tokens;
  final List<dynamic> transactions;
  final Map<String, dynamic> impactStats;

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.tokens,
    required this.transactions,
    required this.impactStats,
  });

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      userId: data['userId'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      tokens: data['tokens'] ?? 0,
      transactions: data['transactions'] ?? [],
      impactStats: data['impactStats'] ?? {},
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'tokens': tokens,
      'transactions': transactions,
      'impactStats': impactStats,
    };
  }
}

// UserProvider class
class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void loadUser(User user) {
    _user = user;
    notifyListeners();
  }

  void updateTokens(int tokens) {
    if (_user != null) {
      _user = User(
        userId: _user!.userId,
        name: _user!.name,
        email: _user!.email,
        tokens: tokens,
        transactions: _user!.transactions,
        impactStats: _user!.impactStats,
      );
      notifyListeners();
    }
  }

  void setName(String name) {
    if (_user != null) {
      _user = User(
        userId: _user!.userId,
        name: name,
        email: _user!.email,
        tokens: _user!.tokens,
        transactions: _user!.transactions,
        impactStats: _user!.impactStats,
      );
      notifyListeners();
    }
  }
}
