import 'package:category_app2/core/errors/failure.dart';
import 'package:category_app2/features/category/data/models/category_model.dart';
import 'package:category_app2/features/category/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ICategoryRepository{

  Future<List<CategoryEntity>> getCategories();


}