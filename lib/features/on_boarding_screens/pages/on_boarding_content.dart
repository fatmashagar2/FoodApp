import 'package:category_app2/core/utils/app_colors.dart';
import 'package:category_app2/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  final String image, title, description;

  const OnboardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Image.asset(AppStrings.shaps,width: 348,height: 361,),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 350,
                width: 189,
                child: Image.asset(
                  image,

                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.red
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            description,
            style: TextStyle(
                color: AppColors.grey
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
