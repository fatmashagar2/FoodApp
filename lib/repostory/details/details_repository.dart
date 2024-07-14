
import 'package:category_app2/model/details_model.dart';
import 'package:category_app2/repostory/details/i_details_reposatory.dart';
import 'package:category_app2/services/details_services.dart';

class DetailsRepository extends IDetailsReposatory {


  @override
  Future<List<DetailsOfMeal>> getDetails(String mealId) async{
    return await DetailsService().fetchDetails(mealId);
  }

}
