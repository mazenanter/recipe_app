import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/services/firebase_services.dart';

part 'add_recipe_state.dart';

class AddRecipeCubit extends Cubit<AddRecipeState> {
  AddRecipeCubit(this.firebaseServices) : super(AddRecipeInitial());

  final FirebaseServices firebaseServices;

  addRecipe({required RecipeModel recipeModel, File? imageFile}) async {
    emit(AddRecipeLoading());
    await firebaseServices
        .addRecipe(
      recipeModel: recipeModel,
      imageFile: imageFile!,
    )
        .then((onValue) {
      emit(AddRecipeSuccess());
    }).catchError((onError) {
      emit(AddRecipeError());
    });
  }
}
