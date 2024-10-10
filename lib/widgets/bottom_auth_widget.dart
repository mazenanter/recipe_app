import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_text_styles.dart';

class BottomAuthWidget extends StatelessWidget {
  const BottomAuthWidget({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.onPressed,
  });
  final String title;
  final String buttonTitle;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.syleMedium11,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(buttonTitle,
              style: AppTextStyles.syleSemiBold11.copyWith(
                color: const Color(0xffFF9C00),
              )),
        ),
      ],
    );
  }
}
