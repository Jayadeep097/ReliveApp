import 'package:flutter/material.dart';

class LearningScreen extends StatelessWidget {
  final List<Map<String, dynamic>> modules = [
    {"title": "Recycling 101", "progress": 0.8},
    {"title": "Energy Saving Tips", "progress": 0.6},
    {"title": "Eco-Friendly Living", "progress": 0.4},
  ];

   LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Modules'),
      ),
      body: ListView.builder(
        itemCount: modules.length,
        itemBuilder: (context, index) {
          final module = modules[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(module['title']),
              subtitle: LinearProgressIndicator(value: module['progress']),
              trailing: Text('${(module['progress'] * 100).toInt()}%'),
            ),
          );
        },
      ),
    );
  }
}
