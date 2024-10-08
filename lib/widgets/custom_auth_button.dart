import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_colors.dart';
import 'package:recipe_app/utils/app_text_styles.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.onPress,
  });
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.baseColor,
        ),
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign In',
              style: AppTextStyles.syleSemiBold16.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 11,
            ),
            const Icon(
              Icons.arrow_forward,
              size: 20,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
