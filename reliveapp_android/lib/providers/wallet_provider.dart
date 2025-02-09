import 'package:flutter/material.dart';

class WalletProvider with ChangeNotifier {
  int _tokens = 0;

  int get tokens => _tokens;

  void addTokens(int amount) {
    _tokens += amount;
    notifyListeners();
  }

  void deductTokens(int amount) {
    if (_tokens >= amount) {
      _tokens -= amount;
      notifyListeners();
    }
  }
}
