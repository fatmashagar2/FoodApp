import 'dart:convert';

import 'package:category_app2/core/databases/cache/cache_helper.dart';
import 'package:category_app2/core/errors/expentions.dart';
import 'package:category_app2/features/category/data/models/category_model.dart';

class CategoryLocalDataSource{
  final CacheHelper cache;
  CategoryLocalDataSource({required this.cache});


cacheCategory(CategoryModel? catToCache ){

  if(catToCache!=null){
    cache.saveData(key: 'CachedCategory', value:json.encode( catToCache.toJson()));
  }
  else{
    throw CacheExeption(errorMessage: 'Internet Connection');
  }
}
}