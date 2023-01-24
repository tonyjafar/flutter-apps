import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/expenses.dart';
import 'package:personal_expenses/models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UserTransactionState();
  }
}

class _UserTransactionState extends State<UserTransaction> {
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
  final amount = TextEditingController();
  final title = TextEditingController();
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

  void submitData() {
    final enteredTitle = title.text;
    var enteredAmount;
    try {
      enteredAmount = double.parse(amount.text);
    } catch (_) {
      enteredAmount = 0;
    }

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    _addTransaction(
      enteredTitle,
      enteredAmount,
    );
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                    controller: title,
                    onSubmitted: (_) => submitData(),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                    ),
                    controller: amount,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    onSubmitted: (_) => submitData(),
                  ),
                  TextButton(
                    onPressed: () => submitData(),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                        Colors.purple,
                      ),
                    ),
                    child: const Text(
                      'Add Transaction',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expenses(_transactions),
        FloatingActionButton(
          onPressed: () => startAddNewTransaction(context),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
