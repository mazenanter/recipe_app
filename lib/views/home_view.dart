import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/utils/app_colors.dart';
import 'package:recipe_app/utils/app_text_styles.dart';
import 'package:recipe_app/utils/custom_indicator.dart';
import 'package:recipe_app/view_model/get_recipes_cubit/get_recipes_cubit.dart';
import 'package:recipe_app/views/add_recipe_view.dart';
import 'package:recipe_app/views/details_view.dart';
import 'package:recipe_app/views/search_view.dart';
import 'package:recipe_app/widgets/fab_button.dart';
import 'package:recipe_app/widgets/header_home.dart';
import 'package:recipe_app/widgets/recipe_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetRecipesCubit, GetRecipesState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                SliverToBoxAdapter(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchView(),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.darkGrayColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.search,
                            color: AppColors.darkGrayColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Search',
                            style: AppTextStyles.syleRegular14,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                if (state is GetRecipesSuccess)
                  SliverGrid.builder(
                    itemCount: state.recipes.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) => RecipeItem(
                      recipeModel: state.recipes[index],
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsView(
                              recipeModel: state.recipes[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                if (state is GetRecipesLoading)
                  const SliverToBoxAdapter(
                    child: CustomIndicator(),
                  ),
                if (state is GetRecipesError)
                  SliverToBoxAdapter(
                    child: Text(state.errMsg),
                  ),
                if (state is GetRecipesList)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        'No Recipes Yet try add one!',
                        style: AppTextStyles.syleSemiBold24,
                      ),
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
      },
    );
  }
}
