import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(c)
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Recipies"),
      ),
      body: const Center(
        child: Text("Hallo"),
      ),
    );
  }
}
