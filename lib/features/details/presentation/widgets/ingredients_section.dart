import 'package:flutter/material.dart';

class IngredientsSection extends StatelessWidget {
  const IngredientsSection({
    Key? key,
    required this.ingredients,
    required this.measures,
  }) : super(key: key);

  final List<String> ingredients;
  final List<String> measures;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ingredients:',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8.0),
          ...ingredients.asMap().entries.map((entry) {
            int idx = entry.key;
            String ingredient = entry.value;
            String measure = measures[idx];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                '$measure $ingredient',
                style: const TextStyle(fontSize: 16.0, color: Colors.black54),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
