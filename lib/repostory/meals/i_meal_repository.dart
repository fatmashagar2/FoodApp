
import 'package:category_app2/model/meals_model.dart';

abstract class IMealRepository{

  Future<List<Meal>> getMeals( String categoryName);


}