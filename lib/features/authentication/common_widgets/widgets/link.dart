import 'package:category_app2/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoginLink extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  // Constructor with required parameters
  const LoginLink({Key? key, required this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text, // Use the text variable directly
          style:  TextStyle(color: AppColors.red),
        ),
      ),
    );
  }
}
