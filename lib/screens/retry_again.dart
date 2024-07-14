import 'package:flutter/material.dart';

class RetryWidget extends StatelessWidget {
  final VoidCallback onRetry;

  RetryWidget({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Please try again',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        IconButton(
          icon: const Icon(Icons.refresh, size: 30),
          onPressed: onRetry,
        ),
      ],
    );
  }
}