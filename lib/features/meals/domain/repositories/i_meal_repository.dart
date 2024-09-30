import 'package:category_app2/core/errors/failure.dart';
import 'package:category_app2/core/params/params.dart';
import 'package:category_app2/features/details/domain/entities/details_entity.dart';
import 'package:category_app2/features/meals/data/models/meals_model.dart';
import 'package:category_app2/features/meals/domain/entities/meals_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IMealRepository{

  Future<Either<Failure, List<MealsEntity>>> getMeals(String categoryName);


}