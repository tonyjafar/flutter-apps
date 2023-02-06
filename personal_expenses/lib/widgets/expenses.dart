import 'package:flutter/material.dart';
import '/models/transaction.dart';
import 'package:personal_expenses/widgets/transaction_item.dart';

class Expenses extends StatelessWidget {
  final List<Transaction> trans;
  final Function deleteTransaction;
  final double appBarHeight;
  const Expenses(this.trans, this.deleteTransaction, this.appBarHeight,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: (MediaQuery.of(context).size.height -
                appBarHeight -
                MediaQuery.of(context).padding.top) *
            0.6,
        child: trans.isEmpty
            ? LayoutBuilder(builder: (ctx, constraints) {
                return Column(
                  children: [
                    Text(
                      'No Transactions added yet!',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.1,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.5,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              })
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return TransactionItems(
                      tran: trans[index], deleteTransaction: deleteTransaction);
                },
                itemCount: trans.length,
              ));
  }
}
