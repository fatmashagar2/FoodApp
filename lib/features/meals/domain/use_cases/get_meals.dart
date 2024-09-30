import 'package:category_app2/features/details/domain/repositories/i_details_reposatory.dart';
import 'package:category_app2/features/meals/domain/entities/meals_entity.dart';
import 'package:category_app2/features/meals/domain/repositories/i_meal_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:category_app2/core/errors/failure.dart';

class GetDetailsUseCase {
  final IMealRepository repository;

  GetDetailsUseCase(this.repository);

  Future<Either<Failure, List<MealsEntity>>> call(String categoryName) async {
    return await repository.getMeals(categoryName);
  }
}
