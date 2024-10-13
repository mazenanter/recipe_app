import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/services/firebase_services.dart';
import 'package:recipe_app/utils/app_colors.dart';
import 'package:recipe_app/utils/app_text_styles.dart';
import 'package:recipe_app/view_model/add_recipe_cubit/add_recipe_cubit.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.recipeModel,
    this.imageFile,
  });
  final RecipeModel recipeModel;
  final File? imageFile;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddRecipeCubit(FirebaseServices()),
      child: BlocConsumer<AddRecipeCubit, AddRecipeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: AppColors.baseColor,
              ),
              onPressed: () {
                BlocProvider.of<AddRecipeCubit>(context).addRecipe(
                  recipeModel: recipeModel,
                  imageFile: imageFile,
                );
              },
              child: Text(
                'Save my recipes',
                style: AppTextStyles.syleSemiBold16.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
