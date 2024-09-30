import 'package:flutter/material.dart';

class RetryWidget extends StatelessWidget {
  final VoidCallback onRetry;

  RetryWidget({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Image.asset('assets/no_internet1.gif',width: 150,height: 150,)
      ],
    );
  }
}