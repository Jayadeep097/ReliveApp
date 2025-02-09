import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import '../models/community_stats_model.dart';

class ImpactTrackingScreen extends StatefulWidget {
  const ImpactTrackingScreen({super.key});

  @override
  _ImpactTrackingScreenState createState() => _ImpactTrackingScreenState();
}

class _ImpactTrackingScreenState extends State<ImpactTrackingScreen> {
  final FirebaseService _firebaseService = FirebaseService();
  List<CommunityStats> stats = [];

  @override
  void initState() {
    super.initState();
    _loadStats();
  }

  Future<void> _loadStats() async {
    try {
      stats = await _firebaseService.fetchCommunityStats();
      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading stats: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Impact Tracking')),
      body: stats.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: stats.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(stats[index].name),
              subtitle: Text('Value: ${stats[index].value}'),
            ),
          );
        },
      ),
    );
  }
}
