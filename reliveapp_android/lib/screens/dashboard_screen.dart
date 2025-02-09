import 'package:flutter/material.dart';
import '../widgets/analytics_dashboard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<double> sampleData = [1.0, 2.5, 3.0, 4.5, 6.0, 5.0, 7.5, 6.0];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: AnalyticsDashboard(data: sampleData),
      ),
    );
  }
}
