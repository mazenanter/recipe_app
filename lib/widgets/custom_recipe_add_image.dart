import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_colors.dart';

class CustomRecipeAddImage extends StatelessWidget {
  const CustomRecipeAddImage({
    super.key,
    required this.onPressed,
    required this.image,
  });
  final void Function() onPressed;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: image == null
            ? null
            : DecorationImage(
                fit: BoxFit.fill,
                image: FileImage(
                  File(image!),
                ),
              ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          color: AppColors.baseColor,
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.camera_enhance_rounded,
          size: 32,
        ),
      ),
    );
  }
}
