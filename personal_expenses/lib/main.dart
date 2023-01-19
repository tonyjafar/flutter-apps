import 'package:flutter/material.dart';
import 'package:personal_expenses/transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 99.55,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Retaurant',
      amount: 23.55,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Expenses"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text(
                'Test 1',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Card(
            child: Column(children: [
              ...(transactions).map((tx) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '\$${tx.amount}',
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            tx.title,
                          ),
                          Text(
                            tx.date.toString(),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ]),
          ),
        ],
      ),
    );
  }
}
