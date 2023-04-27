import 'package:flutter/material.dart';
import '../providers/orders_provider.dart' as order_provider;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final order_provider.OrderItem order;
  const OrderItem({required this.order, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(
              DateFormat("dd MM yyyy hh:mm").format(order.dateTime),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.expand_more),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
