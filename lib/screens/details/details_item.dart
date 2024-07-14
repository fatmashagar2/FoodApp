
import 'package:category_app2/model/details_model.dart';
import 'package:category_app2/model/meals_model.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem({
    super.key,
    required this.details,
  });

  final List<DetailsOfMeal> details;
  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final List<Meal> meals;
    final deatils = details[0];
    return LiquidPullToRefresh(
        height: 100,
        backgroundColor: Colors.white,
        color: Colors.black,
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(deatils.strMealThumb!),
              //ColoredHeartIcon(mealId: meals.,),
              const SizedBox(height: 16.0),
              Text(deatils.strMeal ?? "",
                  style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              Text(deatils.strCategory!, style: const TextStyle(fontSize: 18.0)),
              const SizedBox(height: 8.0),
              Text(deatils.strArea!, style: const TextStyle(fontSize: 18.0)),
              const SizedBox(height: 8.0),
              const Text('Ingredients:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              ...deatils.ingredients!.asMap().entries.map((entry) {
                int idx = entry.key;
                String  ingredient = entry.value;
                String measure = deatils.measures![idx];
                return Text('$measure $ingredient');
              }).toList(),
              const SizedBox(height: 16.0),
              const Text('Instructions:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Text(deatils.strInstructions!),
              const SizedBox(height: 16.0),
              Text('Tags: ${deatils.strTags}', style: const TextStyle(fontSize: 18.0)),
              const SizedBox(height: 16.0),
              if (deatils.strYoutube!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Watch on YouTube:',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    InkWell(
                      child: Text(
                        deatils.strYoutube!,
                        style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ));
  }
}
