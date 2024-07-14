

import 'package:category_app2/model/category_model.dart';
import 'package:category_app2/repostory/category/i_category_repository.dart';
import 'package:category_app2/services/category_services.dart';

class CategoryRepository extends ICategoryRepository {
  @override
  Future<List<Category>> getCategories() async {
    return await CategoryService().getCategories();
  }
}
