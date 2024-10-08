import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_text_styles.dart';

class CustomHeaderHome extends StatelessWidget {
  const CustomHeaderHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Jega',
              style: AppTextStyles.syleSemiBold20,
            ),
            Text(
              'What are you cooking today?',
              style: AppTextStyles.syleRegular11,
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: Color(0xffFFCE80),
          radius: 20,
          backgroundImage: AssetImage(
            'assets/d6cbc6849fe48a0f9d7a0778502d14b5-removebg-preview 1.png',
          ),
        ),
      ],
    );
  }
}
