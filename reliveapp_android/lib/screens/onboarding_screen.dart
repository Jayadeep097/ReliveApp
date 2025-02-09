import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Track Your Impact',
      'description': 'Measure your environmental contributions with ease.',
      'image': 'assets/images/impact.png',
    },
    {
      'title': 'Learn and Grow',
      'description': 'Access modules to learn sustainable practices.',
      'image': 'assets/images/learn.png',
    },
    {
      'title': 'Eco-Friendly Projects',
      'description': 'Discover and support innovative eco-projects.',
      'image': 'assets/images/projects.png',
    },
  ];

  void _onNext() {
    if (_currentPage == _onboardingData.length - 1) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                final data = _onboardingData[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(data['image'] ?? '', height: 200),
                    const SizedBox(height: 20),
                    Text(
                      data['title'] ?? '',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      data['description'] ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                  child: const Text('Skip', style: TextStyle(fontSize: 16)),
                ),
                ElevatedButton(
                  onPressed: _onNext,
                  child: Text(_currentPage == _onboardingData.length - 1 ? 'Finish' : 'Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
