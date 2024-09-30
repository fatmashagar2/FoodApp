import 'package:category_app2/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
 Button({required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.red,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
