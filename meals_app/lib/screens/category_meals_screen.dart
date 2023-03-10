import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> mealsList;

  const CategoryMealsScreen(this.mealsList, {super.key});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late Map<String, String> routeArgs;
  late List<Meal> displayedMeals;
  var loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      displayedMeals = widget.mealsList.where((element) {
        return element.categories.contains(routeArgs['id']);
      }).toList();
      loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title'] as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, ind) {
          return MealItem(
            title: displayedMeals[ind].title,
            imageUrl: displayedMeals[ind].imageUrl,
            duration: displayedMeals[ind].duration,
            complexity: displayedMeals[ind].complexity,
            affordability: displayedMeals[ind].affordability,
            id: displayedMeals[ind].id,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
