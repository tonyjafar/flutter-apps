import 'package:flutter/material.dart';
import '/models/transaction.dart';

import 'package:intl/intl.dart';

class Expenses extends StatelessWidget {
  final List<Transaction> trans;
  const Expenses(this.trans, {super.key});

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
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            '\$${trans[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              trans[index].title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              DateFormat('DD.MM.yyyy')
                                  .format(trans[index].date),
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: trans.length,
              ));
  }
}
