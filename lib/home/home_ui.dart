// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:recipe_app/home/home_bloc.dart';
import 'package:recipe_app/home/home_event.dart';
import 'package:recipe_app/home/home_state.dart';
import 'package:recipe_app/home/widgets.dart';
import 'package:recipe_app/utilis/color_const.dart';
import 'package:recipe_app/utilis/text_const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeBloc()..add(FetchRecipes()),
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          backgroundColor: AppColors.black,
          title: Row(
            children: [
              Icon(
                Icons.fastfood_rounded,
                color: AppColors.primaryColor,
                size: 25,
              ),
              Gap(10),
              Text(
                "Recipe Book",
                style: TextStyles.heading,
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                Icon(
                  Icons.notifications_sharp,
                  color: AppColors.white,
                  size: 25,
                ),
                Gap(20),
                Icon(
                  Icons.calendar_month,
                  color: AppColors.white,
                  size: 25,
                ),
                Gap(30),
              ],
            )
          ],
        ),
        body: BlocBuilder<RecipeBloc, RecipeState>(
          builder: (context, state) {
            if (state is RecipeLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is RecipeLoaded) {
              return ListView.builder(
                itemCount: state.recipes.length,
                itemBuilder: (context, index) {
                  final recipe = state.recipes[index];
                  return FoodCard(
                    title: recipe.name ?? '',
                    rating: recipe.rating.toString(),
                    time: recipe.totalTime ?? '',
                    imageUrl: recipe.images ?? '',
                    authorName: recipe.authorName ?? '',
                    url: recipe.url ?? '',
                  );
                },
              );
            } else if (state is RecipeError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return Center(child: Text('No recipes available.'));
            }
          },
        ),
      ),
    );
  }
}
