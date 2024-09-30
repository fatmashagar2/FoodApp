import 'dart:convert';
import 'package:category_app2/features/details/data/models/details_model.dart';
import 'package:category_app2/features/meals/data/models/meals_model.dart';
import 'package:http/http.dart' as http;

abstract class MealsRemoteDataSource {
  Future<List<MealsModel>> fetchMeals(String categoryName);
}

class MealsRemoteDataSourceImpl implements MealsRemoteDataSource {
  @override
  Future<List<MealsModel>> fetchMeals(String categoryName) async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=$categoryName'));
    if (response.statusCode == 200) {
      List<dynamic>? data = json.decode(response.body)['meals'];
      return data!.map((json) => MealsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load details');
    }
  }
}
