import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_text_styles.dart';
import 'package:recipe_app/views/add_recipe_view.dart';
import 'package:recipe_app/views/details_view.dart';
import 'package:recipe_app/widgets/fab_button.dart';
import 'package:recipe_app/widgets/header_home.dart';
import 'package:recipe_app/widgets/recipe_item.dart';
import 'package:recipe_app/widgets/search_text_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            const SliverToBoxAdapter(child: CustomHeaderHome()),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            const SliverToBoxAdapter(child: SearchTextField()),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            const SliverToBoxAdapter(
              child: Text(
                'Recipes',
                style: AppTextStyles.syleSemiBold20,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 15,
              ),
            ),
            SliverGrid.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              itemBuilder: (context, index) => RecipeItem(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailsView(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: FabButtom(
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddRecipeView(),
            ),
          );
        },
      ),
    );
  }
}
