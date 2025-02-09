import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> _questions = [
    {
      "question": "Which material is most eco-friendly?",
      "options": ["Plastic", "Glass", "Metal", "Paper"],
      "answer": "Paper"
    },
    {
      "question": "What is the key to reducing waste?",
      "options": ["Recycle", "Reuse", "Reduce", "All of the above"],
      "answer": "All of the above"
    },
  ];
  int _currentQuestionIndex = 0;
  int _score = 0;

  void _checkAnswer(String selectedOption) {
    if (selectedOption == _questions[_currentQuestionIndex]['answer']) {
      _score++;
    }
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      Navigator.pushReplacementNamed(
        context,
        '/quiz-result',
        arguments: {'score': _score, 'total': _questions.length},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question['question'],
              style: Theme.of(context).textTheme.headlineMedium, // Updated from headline2
            ),
            const SizedBox(height: 20),
            ...question['options'].map<Widget>((option) {
              return ListTile(
                title: Text(option),
                leading: Radio<String>(
                  value: option,
                  groupValue: null, // Updated for clarity
                  onChanged: (value) => _checkAnswer(option),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}