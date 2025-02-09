import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import '../models/community_stats_model.dart';

class StatsScreen extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();

  StatsScreen({super.key});

  Future<List<CommunityStats>> _fetchStats() async {
    return await _firebaseService.fetchCommunityStats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Community Stats')),
      body: FutureBuilder<List<CommunityStats>>(
        future: _fetchStats(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final stats = snapshot.data!;
          return ListView.builder(
            itemCount: stats.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(stats[index].name),
                subtitle: Text('Value: ${stats[index].value}'),
              );
            },
          );
        },
      ),
    );
  }
}
