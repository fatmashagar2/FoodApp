

import 'package:category_app2/model/meals_model.dart';
import 'package:category_app2/repostory/meals/i_meal_repository.dart';
import 'package:category_app2/services/meals_services.dart';

class MealsRepository extends IMealRepository {


  @override
  Future<List<Meal>> getMeals(String categoryName) async{
    return await MealService().getAllItems(categoryName);
  }
}
