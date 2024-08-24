import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/home/home_event.dart';
import 'package:recipe_app/home/home_state.dart';
import 'package:recipe_app/models/api_modal.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeInitial()) {
    on<FetchRecipes>((event, emit) async {
      emit(RecipeLoading());
      try {
        final recipes = await ReceipieApi.getRecipe();
        emit(RecipeLoaded(recipes));
      } catch (e) {
        emit(RecipeError(e.toString()));
      }
    });
  }
}
