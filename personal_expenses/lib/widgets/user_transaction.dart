import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/add_transaction.dart';
import 'package:personal_expenses/widgets/expenses.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'charts.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UserTransactionState();
  }
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [];

  get _recentTransactions {
    return _transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addTransaction(String txTitle, double txAmount, DateTime txDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: txDate,
    );
    setState(() {
      _transactions.add(newTx);
    });
  }

  void _askUser(Transaction tx) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: ((context) {
        return AlertDialog(
          title: const Text('Please Confirm'),
          actions: [
            TextButton(
              onPressed: () => _deleteTransaction(tx),
              child: const Text('Confirm'),
            ),
            TextButton(
              onPressed: () => {Navigator.of(context).pop()},
              child: const Text('Cancel'),
            )
          ],
        );
      }),
    );
  }

  void _deleteTransaction(Transaction tx) {
    setState(() {
      _transactions.remove(tx);
      Navigator.of(context).pop();
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: AddTransaction(_addTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Charts(_recentTransactions),
        ),
        Expenses(_transactions, _askUser),
        SizedBox(
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * 0.08
              : MediaQuery.of(context).size.height * 0.06,
          child: FloatingActionButton(
            isExtended: true,
            onPressed: () => startAddNewTransaction(context),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
