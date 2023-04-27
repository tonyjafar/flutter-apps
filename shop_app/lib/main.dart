import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/orders_provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import './providers/products_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.deepOrange,
          ),
          fontFamily: "Lato",
        ),
        home: const ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) =>
              const ProductDetailScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
          OrdersScreen.routeName: (context) => const OrdersScreen(),
        },
      ),
    );
  }
}
