import 'package:category_app2/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppStrings.foodIcon1, // Replace with your image path
            height: 250,
            width: 250,
          ),
        ],
      ),
    );
  }
}
