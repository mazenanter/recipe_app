import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_text_styles.dart';
import 'package:recipe_app/widgets/alert_dialig_button.dart';
import 'package:recipe_app/widgets/custom_button.dart';
import 'package:recipe_app/widgets/custom_recipe_add_image.dart';
import 'package:recipe_app/widgets/custom_text_form_field.dart';

class AddRecipeView extends StatelessWidget {
  const AddRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              'Create recipe',
              style: AppTextStyles.syleSemiBold24,
            ),
            SizedBox(
              height: 12,
            ),
            CustomRecipeAddImage(),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              hintText: 'Recipe Name',
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CustomAlertDialogButton(),
                Text(
                  'Add Ingredients',
                  style: AppTextStyles.syleSemiBold20,
                ),
              ],
            ),
            //IngredientsItem(ingredients: ingredients),
            SizedBox(
              height: 28,
            ),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}
