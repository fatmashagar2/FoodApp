import 'package:category_app2/core/errors/expentions.dart';
import 'package:category_app2/features/details/data/remote/data_sources/user_remote_data_source.dart';
import 'package:category_app2/features/details/domain/entities/details_entity.dart';
import 'package:category_app2/features/details/domain/repositories/i_details_reposatory.dart';
import 'package:category_app2/features/meals/domain/entities/meals_entity.dart';
import 'package:category_app2/features/meals/domain/repositories/i_meal_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:category_app2/core/errors/failure.dart';

import '../remote/data_sources/user_remote_data_source.dart';

class MealsReposatoryImp implements IMealRepository {
  final MealsRemoteDataSource remoteDataSource;

  MealsReposatoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<MealsEntity>>> getMeals(String categoryName)async {

    final mealsModels = await remoteDataSource.fetchMeals(categoryName);

    // Transform the data models into domain entities
    final detailsEntities = mealsModels
        .map((model) => MealsEntity(strMeal: model.strMeal, strMealThumb: model.strMealThumb, idMeal: model.idMeal

    ))
        .toList();

    return Right(detailsEntities);

  }

 }
