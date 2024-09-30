import 'package:category_app2/core/errors/expentions.dart';
import 'package:category_app2/features/details/data/remote/data_sources/user_remote_data_source.dart';
import 'package:category_app2/features/details/domain/entities/details_entity.dart';
import 'package:category_app2/features/details/domain/repositories/i_details_reposatory.dart';
import 'package:dartz/dartz.dart';
import 'package:category_app2/core/errors/failure.dart';

class DetailsRepositoryImpl implements IDetailsRepository {
  final DetailsRemoteDataSource remoteDataSource;

  DetailsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<DetailsEntity>>> getDetails(String mealId) async {

      final detailsModels = await remoteDataSource.fetchDetails(mealId);

      // Transform the data models into domain entities
      final detailsEntities = detailsModels
          .map((model) => DetailsEntity(
        idMeal: model.idMeal,
        strMeal: model.strMeal,
        strDrinkAlternate: model.strDrinkAlternate,
        strCategory: model.strCategory,
        strArea: model.strArea,
        strInstructions: model.strInstructions,
        strTags: model.strTags,
        strMealThumb: model.strMealThumb,
        strYoutube: model.strYoutube,
        ingredients: model.ingredients,
        measures: model.measures,
      ))
          .toList();

      return Right(detailsEntities);

    }
  }
