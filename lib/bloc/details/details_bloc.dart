import 'package:bloc/bloc.dart';
import 'package:category_app2/model/details_model.dart';
import 'package:category_app2/repostory/details/details_repository.dart';

import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final String mealId;
  StreamSubscription? _subscription;
  DetailsBloc({required this.mealId, required String categoryName}) : super(DetailsLoading()) {
    on<DetailsEvent>((event, emit) async {
      if (event is GetDetails) {
        emit(DetailsLoading());
        try {
          final details = await DetailsRepository().getDetails(mealId);
          print(mealId);
          emit(DetailsSuccess(details: details));
        } catch (e) {
          print(e);
          emit(DetailsFailure(error: "there is an error ${e.toString()}"));
        }
      }
    });
    _subscription=  Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result == ConnectivityResult.wifi||result==ConnectivityResult.mobile){
        add(GetDetails());
      }else{
        add(NotConnect());
      }
    });

  }
}
