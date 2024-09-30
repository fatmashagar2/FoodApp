import 'package:flutter/material.dart';

class TextPopular extends StatelessWidget {
  const TextPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Popular Today",
      style: TextStyle(
        fontSize: 18,

        fontWeight: FontWeight.bold,
      ),
    );
  }
}
