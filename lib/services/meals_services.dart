import 'dart:convert';

import 'package:category_app2/model/meals_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MealService {
  Future<List<Meal>> getAllItems(String categoryName) async {
    try {
      print("category name in the get meals $categoryName");
      final response = await http.get(Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/filter.php?c=$categoryName'));
      print(response.body);
      if (response.statusCode == 200) {
        List<dynamic>? data = json.decode(response.body)['meals'];
        List<Meal> meals = data!.map((json) => Meal.fromJson(json)).toList();
        print(meals);
        return meals;
      } else {
        throw Exception('Failed to fetch meals');
      }
    } catch (e) {
      throw Exception('Failed to fetch meals: $e');
    }
  }
}
