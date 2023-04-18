import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import './product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavoritesOnly;
  const ProductGrid(this.showFavoritesOnly, {super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final loadedProducts =
        showFavoritesOnly ? productsData.favoritesItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: loadedProducts[index],
        child: const ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
