import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders_provider.dart';
import '../widgets/order_item.dart' as ord_item;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            ord_item.OrderItem(order: ordersData.orders[index]),
        itemCount: ordersData.orders.length,
      ),
    );
  }
}
