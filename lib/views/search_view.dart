import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/services/firebase_services.dart';
import 'package:recipe_app/utils/app_text_styles.dart';
import 'package:recipe_app/utils/custom_indicator.dart';
import 'package:recipe_app/view_model/search_cubit/search_cubit.dart';
import 'package:recipe_app/views/details_view.dart';
import 'package:recipe_app/widgets/recipe_item.dart';
import 'package:recipe_app/widgets/search_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(FirebaseServices()),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SearchTextField(
                      onChanged: (p0) {
                        BlocProvider.of<SearchCubit>(context)
                            .searchRecipes(q: p0);
                      },
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
                  if (state is SearchSuccess)
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
                  if (state is SearchLoading)
                    const SliverToBoxAdapter(
                      child: CustomIndicator(),
                    ),
                  if (state is SearchError)
                    SliverToBoxAdapter(
                      child: Text(state.errMsg),
                    ),
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
