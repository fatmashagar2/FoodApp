
import 'package:category_app2/features/category/data/models/category_model.dart';
import 'package:category_app2/features/category/data/services/category_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
part 'category_event.dart';
part 'category_state.dart';


class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryService categoryService;
  StreamSubscription? _subscription;
  CategoryBloc({required this.categoryService}) : super(CategoryLoading()) {
    on<CategoryEvent>((event, emit) async {
      if (event is GetCategory) {
        emit(CategoryLoading());
        try {
          final cats = await categoryService.getCategories();
          emit(CategorySuccess(cat: cats));
        } catch (e) {
          print(e);
          emit(CategoryFailure(error: "there is an error ${e.toString()}"));
        }
      }
      else if(event is NotConnect){
        emit(CategoryNotConnect(message: 'Not Connected'));
      }
    });
    _subscription=  Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result == ConnectivityResult.wifi||result==ConnectivityResult.mobile){
        add(GetCategory());
      }else{
        add(NotConnect());
      }
    });

  }

}