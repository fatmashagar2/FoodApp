import 'package:dartz/dartz.dart';
import 'package:category_app2/core/errors/failure.dart';
import '../entities/details_entity.dart';

abstract class IDetailsRepository {
  Future<Either<Failure, List<DetailsEntity>>> getDetails(String mealId);
}
