import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/add_transaction.dart';
import 'widgets/expenses.dart';
import 'widgets/charts.dart';
import 'package:personal_expenses/models/transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() {
    return MyAppHome();
  }
}

class MyAppHome extends State<MyApp> {
  void _addTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTx);
    });
  }

  final List<Transaction> _transactions = [
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
  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: AddTransaction(_addTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Personal Expenses"),
          actions: [
            IconButton(
              onPressed: () => startAddNewTransaction(context),
              icon: const Icon(
                Icons.add,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            const Charts(),
            Expenses(_transactions),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () => startAddNewTransaction(context),
        ),
      ),
    );
  }
}
