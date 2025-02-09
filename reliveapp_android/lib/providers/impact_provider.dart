import 'package:flutter/material.dart';

// Dependencies for backend interactions

class ImpactProvider with ChangeNotifier {
  final Map<String, double> _impactStats = {
    "Recycled Plastic": 0.0,
    "Saved Energy": 0.0,
    "Planted Trees": 0.0,
  };

  Map<String, double> get impactStats => _impactStats;

  void updateImpact(String category, double value) {
    _impactStats[category] = value;
    notifyListeners();
  }
}
