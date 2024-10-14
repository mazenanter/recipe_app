import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/utils/app_colors.dart';
import 'package:recipe_app/utils/app_text_styles.dart';
import 'package:recipe_app/utils/image_picker.dart';
import 'package:recipe_app/widgets/alert_dialig_button.dart';
import 'package:recipe_app/widgets/custom_button.dart';
import 'package:recipe_app/widgets/custom_recipe_add_image.dart';
import 'package:recipe_app/widgets/custom_text_form_field.dart';
import 'package:recipe_app/widgets/ingredients_item.dart';

class AddRecipeView extends StatefulWidget {
  const AddRecipeView({super.key});

  @override
  State<AddRecipeView> createState() => _AddRecipeViewState();
}

class _AddRecipeViewState extends State<AddRecipeView> {
  TextEditingController recipeTitle = TextEditingController();
  TextEditingController recipeSubTitle = TextEditingController();
  TextEditingController ingredient = TextEditingController();
  File? image;
  List<String> ingredients = [];
  @override
  Widget build(BuildContext context) {
    var userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    var userName = FirebaseAuth.instance.currentUser?.displayName ?? '';
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Create recipe',
              style: AppTextStyles.syleSemiBold24,
            ),
            const SizedBox(
              height: 12,
            ),
            CustomRecipeAddImage(
              image: image?.path,
              onPressed: () {
                customDialog(context);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: recipeTitle,
              hintText: 'Recipe Name',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CustomAlertDialogButton(
                  ingredientController: ingredient,
                  onPressed: () {
                    setState(() {
                      ingredients.add(ingredient.text);
                      ingredient.clear();
                      Navigator.pop(context);
                    });
                  },
                ),
                const Text(
                  'Add Ingredients',
                  style: AppTextStyles.syleSemiBold20,
                ),
              ],
            ),
            IngredientsItem(ingredients: ingredients),
            const SizedBox(
              height: 28,
            ),
            CustomButton(
              recipeModel: RecipeModel(
                recipeTitle: recipeTitle.text,
                recipeSubTitle: recipeSubTitle.text,
                image: image?.path ?? '',
                userId: userId,
                userName: userName,
                ingredients: ingredients,
              ),
              imageFile: image,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> customDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text('Choose source'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      var pickedFile =
                          await ImagePickerService().pickImageFromCamera();
                      image = pickedFile;
                      setState(() {});
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Camera',
                      style: TextStyle(color: AppColors.baseColor),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      var pickedFile =
                          await ImagePickerService().pickImageFromGallery();
                      image = pickedFile;
                      setState(() {});
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Gallery',
                      style: TextStyle(color: AppColors.baseColor),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
