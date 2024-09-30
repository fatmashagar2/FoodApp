import 'dart:convert';

import 'package:category_app2/features/details/data/models/details_model.dart';
import 'package:http/http.dart' as http;

import '../features/details/domain/entities/details_entity.dart';

class DetailsService {
 Future<List<DetailsModel>> fetchDetails(String mealId) async {
   print("meal id in the get meals $mealId");
    final response = await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId"));
    if (response.statusCode == 200) {
      List<dynamic>? data = json.decode(response.body)['meals'];
      List<DetailsModel> details = data!.map((json) => DetailsModel.fromJson(json)).toList();

      print(details);
      return details;
    } else {
      throw Exception('Failed to load details');
    }
  }
}
