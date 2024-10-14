import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/services/firebase_services.dart';

part 'get_recipes_state.dart';

class GetRecipesCubit extends Cubit<GetRecipesState> {
  GetRecipesCubit(this.firebaseServices) : super(GetRecipesInitial());

  final FirebaseServices firebaseServices;
  List<RecipeModel>? recipesList;
  Future<void> getAllRecipes() async {
    emit(GetRecipesLoading());
    var res = await firebaseServices.getRecipes();
    res.fold(
      (fail) {
        log(fail.errMsg);
        return emit(GetRecipesError(fail.errMsg));
      },
      (recipes) {
        log('Success Items Gets ${recipes.length.toString()}');
        recipesList = recipes;
        if (recipesList!.isEmpty) {
          return emit(GetRecipesList());
        }
        return emit(GetRecipesSuccess(recipes));
      },
    );
  }
}
