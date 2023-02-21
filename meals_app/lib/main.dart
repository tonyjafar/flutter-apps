import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = dummyMeals;

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeals = dummyMeals.where((meal) {
        if (filters['gluten'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        secondaryHeaderColor: Colors.amber,
        canvasColor: const Color.fromARGB(255, 233, 232, 226),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromARGB(20, 51, 51, 1),
              ),
              bodySmall: const TextStyle(
                color: Color.fromARGB(20, 51, 51, 1),
              ),
              titleLarge: const TextStyle(
                fontSize: 20.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: "/",
      routes: {
        '/': (ctx) => const TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals),
        MealScreen.routeName: (ctx) => const MealScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              filters,
              setFilters,
            ),
      },
    );
  }
}
