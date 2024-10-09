import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_colors.dart';
import 'package:recipe_app/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: AppColors.baseColor,
        ),
        onPressed: () {},
        child: Text(
          'Save my recipes',
          style: AppTextStyles.syleSemiBold16.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
