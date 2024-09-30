import 'package:flutter/material.dart';
import 'package:category_app2/core/utils/app_strings.dart';

class NoMealsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppStrings.notFound,
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
