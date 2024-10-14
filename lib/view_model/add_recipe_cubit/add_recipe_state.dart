part of 'add_recipe_cubit.dart';

@immutable
sealed class AddRecipeState {}

final class AddRecipeInitial extends AddRecipeState {}

final class AddRecipeLoading extends AddRecipeState {}

final class AddRecipeSuccess extends AddRecipeState {}

final class AddRecipeError extends AddRecipeState {}
