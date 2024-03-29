import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders_provider.dart';

import '../providers/cart_provider.dart' show Cart;
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 20),
                ),
                const Spacer(),
                Chip(
                  label: Text(
                    "\$${cart.cartTotal.toStringAsFixed(2)}",
                    style: TextStyle(
                      color:
                          Theme.of(context).primaryTextTheme.titleLarge?.color,
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<Orders>(context, listen: false).addOrder(
                      cart.item.values.toList(),
                      cart.cartTotal,
                    );
                    cart.cleanCart();
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  child: const Text("Order Now"),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => CartItem(
              id: cart.item.values.toList()[index].id,
              productID: cart.item.keys.toList()[index],
              title: cart.item.values.toList()[index].title,
              quantity: cart.item.values.toList()[index].quantity,
              price: cart.item.values.toList()[index].price,
            ),
            itemCount: cart.itemCount,
          ),
        )
      ]),
    );
  }
}
