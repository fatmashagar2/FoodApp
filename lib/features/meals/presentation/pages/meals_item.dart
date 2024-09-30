
import 'package:category_app2/model/meals_model.dart';
import 'package:category_app2/screens/fav_icon.dart';
import 'package:category_app2/screens/meals/search.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class MealsItem extends StatefulWidget {
  final List<Meal> meals;

  const MealsItem({super.key, required this.meals});

  @override
  _MealsItemState createState() => _MealsItemState();
}

class _MealsItemState extends State<MealsItem> {
  List<Meal> filteredMeals = [];

  Future<void> onRefresh()async {
    await  Future.delayed(Duration(seconds: 2));
  }

  @override
  void initState() {
    super.initState();
    filteredMeals = widget.meals;
  }

  void searchMeals(String str) {
    setState(() {
      filteredMeals = widget.meals
          .where(
              (meal) => meal.strMeal.toLowerCase().contains(str.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
        height: 100,
        backgroundColor: Colors.white,
        color: Colors.black,
        onRefresh:onRefresh ,child: Column(
      children: [
        Search(onSearch: searchMeals),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: filteredMeals.length,
            itemBuilder: (context, index) {
              final meal = filteredMeals[index];
              return Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/details',
                        arguments: meal.idMeal);

                  },
                  child: Card(
                    elevation: 4.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.network(
                            meal.strMealThumb,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          meal.idMeal,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          meal.strMeal,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8.0),
                        ColoredHeartIcon(mealId:  meal.idMeal,)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

    ],
  ));
  }
}
