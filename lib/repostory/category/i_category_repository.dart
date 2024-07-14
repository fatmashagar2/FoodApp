
import 'package:category_app2/model/category_model.dart';

abstract class ICategoryRepository{

  Future<List<Category>> getCategories();


}