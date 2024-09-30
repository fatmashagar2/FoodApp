import 'package:category_app2/features/details/presentation/widgets/ingredients_section.dart';
import 'package:category_app2/features/details/presentation/widgets/instructions_section.dart';
import 'package:category_app2/features/details/presentation/widgets/tags_section.dart';
import 'package:flutter/material.dart';

class DetailsContent extends StatelessWidget {
  const DetailsContent({
    Key? key,
    required this.mealName,
    required this.category,
    required this.area,
    required this.ingredients,
    required this.measures,
    required this.instructions,
    required this.tags,
  }) : super(key: key);

  final String mealName;
  final String category;
  final String area;
  final List<String> ingredients;
  final List<String> measures;
  final String instructions;
  final String tags;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mealName,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              area,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        IngredientsSection(
          ingredients: ingredients,
          measures: measures,
        ),
        const SizedBox(height: 20),
        InstructionsSection(instructions: instructions),
        const SizedBox(height: 20),
        TagsSection(tags: tags),
      ],
    );
  }
}
