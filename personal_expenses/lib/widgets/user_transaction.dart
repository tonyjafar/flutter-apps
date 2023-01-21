import 'package:flutter/cupertino.dart';
import 'package:personal_expenses/widgets/add_ransaction.dart';
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
  @override
  Widget build(BuildContext context) {
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
    return Column(
      children: [
        AddTransaction(),
        Expenses(transactions),
      ],
    );
  }
}
