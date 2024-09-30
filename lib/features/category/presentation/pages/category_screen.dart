

import 'package:category_app2/bloc/category/category_bloc.dart';
import 'package:category_app2/screens/category/category_items.dart';
import 'package:category_app2/screens/retry_again.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Categories'),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategorySuccess) {
            return category_items(categories: state.cat);
          }
        else {
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
