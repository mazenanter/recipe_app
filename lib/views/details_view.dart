import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/utils/app_text_styles.dart';
import 'package:recipe_app/widgets/ingredirents_details_list_view.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.recipeModel});
  final RecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
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
            Text(
              'How to make ${recipeModel.recipeTitle}',
              style: AppTextStyles.syleSemiBold24,
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    recipeModel.image,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Ingredients',
              style: AppTextStyles.syleSemiBold20,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => IngredientsDetailsListView(
                  title: recipeModel.ingredients[index],
                ),
                itemCount: recipeModel.ingredients.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
