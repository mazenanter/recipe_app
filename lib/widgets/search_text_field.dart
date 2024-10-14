import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.onChanged,
  });
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'search recipe',
          hintStyle: const TextStyle(
            color: AppColors.darkGrayColor,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.darkGrayColor,
          ),
          focusedBorder: buildBorder(),
          enabledBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        width: 2,
        color: AppColors.grayColor,
      ),
    );
  }
}
