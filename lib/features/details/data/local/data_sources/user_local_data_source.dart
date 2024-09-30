import 'dart:convert';

import 'package:category_app2/core/databases/cache/cache_helper.dart';
import 'package:category_app2/core/errors/expentions.dart';
import 'package:category_app2/features/category/data/models/category_model.dart';
import 'package:category_app2/features/details/data/models/details_model.dart';

class DetailsLocalDataSource{
  final CacheHelper cache;
  DetailsLocalDataSource({required this.cache});


  cacheDetails(DetailsModel? detailsToCache ){

    if(detailsToCache!=null){
      cache.saveData(key: 'CachedCategory', value:json.encode( detailsToCache.toJson()));
    }
    else{
      throw CacheExeption(errorMessage: 'Internet Connection');
    }
  }
}