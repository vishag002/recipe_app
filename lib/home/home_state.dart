// lib/bloc/recipe_state.dart

import 'package:recipe_app/models/receipe_model.dart';

abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<Recipie> recipes;

  RecipeLoaded(this.recipes);
}

class RecipeError extends RecipeState {
  final String message;

  RecipeError(this.message);
}
