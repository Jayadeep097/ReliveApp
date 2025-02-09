import 'package:flutter/material.dart';
import '../widgets/sustainability_card.dart';

class EcoProjectsScreen extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {
      "title": "Plastic Recycling Initiative",
      "description": "Convert waste plastic into reusable products.",
    },
    {
      "title": "Solar Panel Installation",
      "description": "Provide affordable solar panels for households.",
    },
    {
      "title": "Tree Plantation Drive",
      "description": "Plant 10,000 trees in urban areas.",
    },
  ];

   EcoProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eco-Friendly Projects'),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return SustainabilityCard(
            title: project['title']!,
            description: project['description']!,
            icon: Icons.eco,
          );
        },
      ),
    );
  }
}
