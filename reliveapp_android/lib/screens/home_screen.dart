import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relive Home'),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Welcome to Relive!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.green.shade900,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildFeatureButton(
            context,
            icon: Icons.track_changes,
            label: 'Track Your Impact',
            routeName: '/impact',
          ),
          _buildFeatureButton(
            context,
            icon: Icons.school,
            label: 'Learn More',
            routeName: '/learning',
          ),
          _buildFeatureButton(
            context,
            icon: Icons.account_balance_wallet,
            label: 'Wallet',
            routeName: '/wallet',
          ),
          _buildFeatureButton(
            context,
            icon: Icons.person,
            label: 'Profile',
            routeName: '/profile',
          ),
        ],
      ),
    );
  }

  /// Helper function to build feature buttons with icons
  Widget _buildFeatureButton(BuildContext context,
      {required IconData icon, required String label, required String routeName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green.shade600,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () => Navigator.pushNamed(context, routeName),
        icon: Icon(icon, size: 24, color: Colors.white),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
