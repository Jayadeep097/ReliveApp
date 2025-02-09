import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class ProjectListScreen extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();

  ProjectListScreen({super.key});

  Future<List<Map<String, dynamic>>> _fetchProjects() async {
    return await _firebaseService.fetchAllProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Projects')),
      body: FutureBuilder(
        future: _fetchProjects(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          List<Map<String, dynamic>> projects = snapshot.data as List<Map<String, dynamic>>;
          return ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(projects[index]['name']),
                  subtitle: Text(projects[index]['description']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
