import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? const Center(
            child: Text("You have no favorites yet!"),
          )
        : ListView.builder(
            itemBuilder: (ctx, ind) {
              return MealItem(
                title: favoriteMeals[ind].title,
                imageUrl: favoriteMeals[ind].imageUrl,
                duration: favoriteMeals[ind].duration,
                complexity: favoriteMeals[ind].complexity,
                affordability: favoriteMeals[ind].affordability,
                id: favoriteMeals[ind].id,
              );
            },
            itemCount: favoriteMeals.length,
          );
  }
}
