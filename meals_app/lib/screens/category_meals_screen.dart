import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryMeals = dummyMeals.where((element) {
      return element.categories.contains(routeArgs['id']);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title'] as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, ind) {
          return MealItem(
            title: categoryMeals[ind].title,
            imageUrl: categoryMeals[ind].imageUrl,
            duration: categoryMeals[ind].duration,
            complexity: categoryMeals[ind].complexity,
            affordability: categoryMeals[ind].affordability,
            id: categoryMeals[ind].id,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
