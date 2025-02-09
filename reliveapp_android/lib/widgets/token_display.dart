import 'package:flutter/material.dart';

class TokenDisplay extends StatelessWidget {
  final int tokens;

  const TokenDisplay({super.key, required this.tokens});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.token, color: Colors.amber, size: 32),
        const SizedBox(width: 10),
        Text('$tokens Tokens', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
