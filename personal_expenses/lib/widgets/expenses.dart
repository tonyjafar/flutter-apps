import 'package:flutter/material.dart';
import '/models/transaction.dart';

import 'package:intl/intl.dart';

class Expenses extends StatelessWidget {
  final List<Transaction> trans;
  final Function deleteTransaction;
  const Expenses(this.trans, this.deleteTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 350,
        child: trans.isEmpty
            ? Column(
                children: [
                  Text(
                    'No Transactions added yet!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 100,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text('\$${trans[index].amount}'),
                          ),
                        ),
                      ),
                      title: Text(
                        trans[index].title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(trans[index].date),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () =>
                            deleteTransaction(trans.elementAt(index)),
                        color: Colors.red,
                      ),
                    ),
                  );
                },
                itemCount: trans.length,
              ));
  }
}
