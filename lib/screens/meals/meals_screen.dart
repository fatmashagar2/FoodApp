
import 'package:category_app2/bloc/meals/meals_bloc.dart';
import 'package:category_app2/screens/meals/meals_item.dart';
import 'package:category_app2/screens/retry_again.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meals'),
      ),
      body: BlocBuilder<MealsBloc, MealsState>(
        builder: (context, state) {
          if (state is MealsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MealsSuccess) {
            return MealsItem(meals: state.mal!);
          } else {
            return  Center(
              child: RetryWidget(
                onRetry: ()async {
                  await Future.delayed(Duration(seconds: 2));
                  // Add your retry logic here
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
