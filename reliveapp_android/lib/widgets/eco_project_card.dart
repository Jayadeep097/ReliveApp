import 'package:flutter/material.dart';

class EcoProjectCard extends StatelessWidget {
  final String title;
  final String description;

  const EcoProjectCard({super.key, 
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}
