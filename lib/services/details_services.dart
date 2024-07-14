import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/details_model.dart';

class DetailsService {
 Future<List<DetailsOfMeal>> fetchDetails(String mealId) async {
   print("meal id in the get meals $mealId");
    final response = await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId"));
    if (response.statusCode == 200) {
      List<dynamic>? data = json.decode(response.body)['meals'];
      List<DetailsOfMeal> details = data!.map((json) => DetailsOfMeal.fromJson(json)).toList();

      print(details);
      return details;
    } else {
      throw Exception('Failed to load details');
    }
  }
}
