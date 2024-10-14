part of 'get_recipes_cubit.dart';

@immutable
sealed class GetRecipesState {}

final class GetRecipesInitial extends GetRecipesState {}

final class GetRecipesLoading extends GetRecipesState {}

final class GetRecipesSuccess extends GetRecipesState {
  final List<RecipeModel> recipes;

  GetRecipesSuccess(this.recipes);
}

final class GetRecipesError extends GetRecipesState {
  final String errMsg;

  GetRecipesError(this.errMsg);
}

final class GetRecipesList extends GetRecipesState {}
