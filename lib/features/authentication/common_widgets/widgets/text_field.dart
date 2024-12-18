import 'package:category_app2/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldAll extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String? errorText;
  final String labelText;
  final IconData prefixIcon;
  final VoidCallback? onSuffixIconPressed;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  const TextFieldAll({
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.errorText,
    this.onSuffixIconPressed,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,

      controller: controller,
      style:  TextStyle(
        color: AppColors.red
      ),
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle:  TextStyle(color: AppColors.red),
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: AppColors.red),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: AppColors.red),
        ),
        prefixIcon: Icon(prefixIcon, color: AppColors.red),
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(suffixIcon, color: AppColors.red),
          onPressed: onSuffixIconPressed,
        )
            : null,
        errorText: errorText,
      ),
    );
  }
}
