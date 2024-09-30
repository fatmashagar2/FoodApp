import 'dart:convert';

import 'package:category_app2/core/databases/cache/cache_helper.dart';
import 'package:category_app2/core/errors/expentions.dart';
import 'package:category_app2/features/category/data/models/category_model.dart';
import 'package:category_app2/features/meals/data/models/meals_model.dart';

class MealsLocalDataSource{
  final CacheHelper cache;
  MealsLocalDataSource({required this.cache});


  cacheMeal(MealsModel? mealToCache ){

    if(mealToCache!=null){
      cache.saveData(key: 'CachedCategory', value:json.encode( mealToCache.toJson()));
    }
    else{
      throw CacheExeption(errorMessage: 'Internet Connection');
    }
  }
}