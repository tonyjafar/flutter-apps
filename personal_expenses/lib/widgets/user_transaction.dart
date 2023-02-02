import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/add_transaction.dart';
import 'package:personal_expenses/widgets/expenses.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'charts.dart';

class UserTransaction extends StatefulWidget {
  final double appBarHeight;
  const UserTransaction(this.appBarHeight, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _UserTransactionState();
  }
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [];
  bool chartSet = false;

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
          child: AddTransaction(
            _addTransaction,
            widget.appBarHeight,
          ),
        );
      },
    );
  }

  void setVariable() {
    setState(() {
      chartSet = !chartSet;
    });
  }

  List<Widget> setWidgets() {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      if (chartSet) {
        return [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Show Chart",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Switch.adaptive(
                value: chartSet,
                onChanged: (value) => setVariable(),
              ),
            ],
          ),
          SizedBox(
            child: Charts(_recentTransactions),
          )
        ];
      } else {
        return [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Show Chart",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Switch.adaptive(
                value: chartSet,
                onChanged: (value) => setVariable(),
              ),
            ],
          ),
          Expenses(_transactions, _askUser, widget.appBarHeight)
        ];
      }
    } else {
      return [
        SizedBox(
          child: Charts(_recentTransactions),
        ),
        Expenses(_transactions, _askUser, widget.appBarHeight)
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...setWidgets(),
        SizedBox(
          height: (MediaQuery.of(context).size.height -
                  widget.appBarHeight -
                  MediaQuery.of(context).padding.top) *
              0.09,
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
