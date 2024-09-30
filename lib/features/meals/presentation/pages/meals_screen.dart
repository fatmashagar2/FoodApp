import 'package:category_app2/core/utils/app_colors.dart';
import 'package:category_app2/core/utils/app_strings.dart';
import 'package:category_app2/features/meals/presentation/manager/bloc/meals/meals_bloc.dart';
import 'package:category_app2/features/meals/presentation/widgets/meals_item.dart';
import 'package:category_app2/features/retry_again/retry_again.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
          "Meals",
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),

        actions: [Image.asset(AppStrings.meals,width: 100,height: 100,)],
      ),
      body: BlocBuilder<MealsBloc, MealsState>(
        builder: (context, state) {
          if (state is MealsLoading) {
            return  Center(child: SpinKitFadingCircle(color: AppColors.red, size: 50.0));
          } else if (state is MealsSuccess) {
            return MealsItem(meals: state.mal!);
          } else {
            return Center(
              child: RetryWidget(
                onRetry: () async {
                  await Future.delayed(Duration(seconds: 2));
                  print('Retry clicked');
                },
              ),
            );
          }
        },
      ),
    );
  }
}
