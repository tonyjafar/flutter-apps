import 'package:flutter/material.dart';
import '../providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product_detail_screen";
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final loadedProducts = productsData.items;
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final product = loadedProducts.firstWhere(
      (element) => productId == element.id,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
