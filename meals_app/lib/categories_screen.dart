import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'category_item.dart';

class GatecoriesScreen extends StatelessWidget {
  const GatecoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TonyMeals"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: dummyCatageroy
            .map(
              (cat) => CategoryItem(
                cat.title,
                cat.color,
              ),
            )
            .toList(),
      ),
    );
  }
}
