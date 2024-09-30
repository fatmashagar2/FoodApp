import 'package:category_app2/features/category/domain/entities/category_entity.dart';
import 'package:category_app2/features/category/domain/repositories/i_category_repository.dart';

class GetCategoriesUseCase {
  final ICategoryRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<CategoryEntity>> call() async {
    return await repository.getCategories();
  }
}
