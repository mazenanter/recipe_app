import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_colors.dart';
import 'package:recipe_app/utils/app_text_styles.dart';

class IngredientsDetailsListView extends StatelessWidget {
  const IngredientsDetailsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        color: AppColors.cardColor,
        child: ListTile(
          title: const Text(
            'Bread',
            style: AppTextStyles.syleSemiBold16,
          ),
          trailing: const Text(
            '200g',
            style: AppTextStyles.syleRegular14,
          ),
          leading: Image.asset('assets/🍜.png'),
        ),
      ),
    );
  }
}
