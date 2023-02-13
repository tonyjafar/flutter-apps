import 'package:flutter/material.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
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
        '/': (ctx) => const GatecoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen()
      },
    );
  }
}
