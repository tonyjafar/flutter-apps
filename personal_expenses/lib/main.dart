import 'package:flutter/material.dart';
import 'package:personal_expenses/transaction.dart';
import 'expenses.dart';
import 'add_ransaction.dart';
import 'charts.dart';

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Personal Expenses"),
      ),
      body: Column(
        children: [
          const Charts(),
          const AddTransaction(),
          Expenses(transactions),
        ],
      ),
    );
  }
}
