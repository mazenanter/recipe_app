import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    required this.controller,
    this.validator,
    this.secureText = false,
  });
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool secureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secureText ? true : false,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.grayColor,
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );
  }
}
