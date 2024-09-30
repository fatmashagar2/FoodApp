import 'package:category_app2/core/errors/failure.dart';
import 'package:category_app2/features/details/domain/repositories/i_details_reposatory.dart';
import 'package:dartz/dartz.dart';
import '../entities/details_entity.dart';

class GetDetailsUseCase {
  final IDetailsRepository repository;

  GetDetailsUseCase(this.repository);

  Future<Either<Failure, List<DetailsEntity>>> call(String mealId) async {
    return await repository.getDetails(mealId);
  }
}
