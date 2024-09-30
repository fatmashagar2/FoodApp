import 'dart:convert';
import 'package:category_app2/features/details/data/models/details_model.dart';
import 'package:http/http.dart' as http;

abstract class DetailsRemoteDataSource {
  Future<List<DetailsModel>> fetchDetails(String mealId);
}

class DetailsRemoteDataSourceImpl implements DetailsRemoteDataSource {
  @override
  Future<List<DetailsModel>> fetchDetails(String mealId) async {
    final response = await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId"));
    if (response.statusCode == 200) {
      List<dynamic>? data = json.decode(response.body)['meals'];
      return data!.map((json) => DetailsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load details');
    }
  }
}
