import 'package:flutter/material.dart';
import 'dummy_data.dart';

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
          return Text(categoryMeals[ind].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
