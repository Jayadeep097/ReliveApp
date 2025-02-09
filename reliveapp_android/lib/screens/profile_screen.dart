import 'package:flutter/material.dart';
import '../services/openai_service.dart';

class ProfileScreen extends StatelessWidget {
  final OpenAIService _openAIService = OpenAIService();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Profile',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 10),
            FutureBuilder<String>(
              future: _openAIService.getUserInsight('How can I improve sustainability?'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text(
                    'Error: ${snapshot.error}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                } else {
                  return Text(
                    'AI Insight: ${snapshot.data}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
