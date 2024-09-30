import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:category_app2/features/meals/data/models/meals_model.dart';
import 'package:category_app2/features/meals/domain/entities/meals_entity.dart';
import 'package:category_app2/features/meals/domain/repositories/i_meal_repository.dart';
import 'package:category_app2/features/meals/data/services/meals_services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'meals_event.dart';
part 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  final String categoryName;
  Set<String> favoriteMealIds = {};
  StreamSubscription? _subscription;
  MealsBloc({required this.categoryName}) : super(MealsLoading()) {
    on<MealsEvent>((event, emit) async {
      if (event is Getitem) {
        emit(MealsLoading());
        try {
          final mal = await MealService().getAllItems(categoryName);
          emit(MealsSuccess(mal: mal, favoriteMealIds: favoriteMealIds));
        } catch (e) {
          emit(MealsFailure(error: "There is an error: ${e.toString()}"));
        }
      }
    });
    on<ToggleFavorite>((event, emit) {
      if (favoriteMealIds.contains(event.mealId)) {
        favoriteMealIds.remove(event.mealId);
      } else {
        favoriteMealIds.add(event.mealId);
      }

      if (state is MealsSuccess) {
        emit(MealsSuccess(mal: (state as MealsSuccess).mal, favoriteMealIds: favoriteMealIds));
      }
    });
    _subscription=  Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result == ConnectivityResult.wifi||result==ConnectivityResult.mobile){
        add(Getitem());
      }else{
        add(NotConnect());
      }
    });

  }
}
