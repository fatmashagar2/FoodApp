import 'package:category_app2/features/category/data/remote/data_sources/user_remote_data_source.dart';
import 'package:category_app2/features/category/domain/repositories/i_category_repository.dart';

import '../../domain/entities/category_entity.dart';

class CategoryRepositoryImpl implements ICategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final categoryModels = await remoteDataSource.getCategories();

    // Map CategoryModel to CategoryEntity if needed
    final categoryEntities = categoryModels.map((model) => CategoryEntity(
      id: model.id,
      name: model.name,

      description: model.description, thumbnailUrl: model.thumbnailUrl,
    )).toList();

    return categoryEntities;
  }
}
