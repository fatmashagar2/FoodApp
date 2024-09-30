import 'package:category_app2/core/utils/app_colors.dart';
import 'package:category_app2/core/utils/app_strings.dart';
import 'package:category_app2/features/meals/data/models/meals_model.dart';
import 'package:category_app2/features/meals/presentation/widgets/meal_grid.dart';
import 'package:category_app2/features/meals/presentation/widgets/no_meals_found.dart';
import 'package:category_app2/features/meals/presentation/widgets/search_bar.dart';
import 'package:category_app2/features/search/presentation/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class MealsItem extends StatefulWidget {
  final List<MealsModel> meals;

  const MealsItem({super.key, required this.meals});

  @override
  _MealsItemState createState() => _MealsItemState();
}

class _MealsItemState extends State<MealsItem> {
  List<MealsModel> filteredMeals = [];

  Future<void> onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  void initState() {
    super.initState();
    filteredMeals = widget.meals;
  }

  void searchMeals(String str) {
    setState(() {
      filteredMeals = widget.meals
          .where((meal) => meal.strMeal.toLowerCase().contains(str.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidPullToRefresh(
        height: 100,
        backgroundColor: AppColors.main,
        color: Colors.black,
        onRefresh: onRefresh,
        child: Column(
          children: [
            SearchBarr(onSearch: searchMeals),
            Expanded(
              child: filteredMeals.isNotEmpty
                  ? MealGrid(meals: filteredMeals)
                  : NoMealsFound(),
            ),
          ],
        ),
      ),
    );
  }
}
