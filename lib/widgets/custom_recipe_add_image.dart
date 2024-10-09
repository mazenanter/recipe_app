import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_colors.dart';

class CustomRecipeAddImage extends StatelessWidget {
  const CustomRecipeAddImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          color: AppColors.baseColor,
        ),
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.camera_enhance_rounded,
          size: 32,
        ),
      ),
    );
  }
}
