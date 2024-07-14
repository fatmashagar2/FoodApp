
import 'package:category_app2/model/details_model.dart';

abstract class IDetailsReposatory{

  Future<List<DetailsOfMeal>> getDetails( String mealId);


}