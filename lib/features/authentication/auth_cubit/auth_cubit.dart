import 'dart:convert';

import 'package:category_app2/features/authentication/auth_cubit/auth_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  void register(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    emit(RegisterLoadingState());
    Response response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/register'),
        headers: {
          'lang': 'en'
        },
        body: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password
        });
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      emit(RegisterSuccessState());
      print(responseBody);
    } else {
      emit(FailedState(message: responseBody['message']));
      print(responseBody);
    }
  }

  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
   try{
     Response response = await http.post(
       Uri.parse("https://student.valuxapps.com/api/login"),
       body: {
         'email': email,
         'password': password,
       },
       headers: {
         'lang': 'en'
       },
     );
     if(response.statusCode==200){
       var data=jsonDecode(response.body);
       if(data['status']==true){
         debugPrint("user login success and his data is ${data}");
         emit(LoginSuccessState());
       }
       else{
         debugPrint("Failed login success and his data is ${data['message']}");
         emit(LoginFailedState(message: data['message']));
       }
     }
   }
   catch(e){

     emit(LoginFailedState(message: e.toString()));
   }
  }
}
