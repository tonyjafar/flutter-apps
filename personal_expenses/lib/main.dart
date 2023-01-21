import 'package:flutter/material.dart';
import 'package:personal_expenses/transaction.dart';
import 'expenses.dart';
import 'add_ransaction.dart';
import 'charts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var titleInput = TextEditingController();
  var amountInput = TextEditingController();
  List<Transaction> transactions = [
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
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Personal Expenses"),
        ),
        body: Column(
          children: [
            const Charts(),
            AddTransaction(amountInput, titleInput),
            Expenses(transactions),
          ],
        ),
      ),
    );
  }
}
