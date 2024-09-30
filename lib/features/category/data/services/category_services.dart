import 'dart:convert';
import 'package:category_app2/features/category/data/models/category_model.dart';
import 'package:http/http.dart' as http;

import '../features/category/domain/entities/category_entity.dart';

class CategoryService {
  Future<List<CategoryModel>> getCategories() async {

      final response = await http.get(
          Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['categories'];
        //print(data.map((json) => CategoryEntity.fromJson(json)).toList());
        return data.map((json) => CategoryModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch categories');
      }
    }


}
