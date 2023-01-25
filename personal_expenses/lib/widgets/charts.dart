import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class Charts extends StatelessWidget {
  final List<Transaction> recentTransaction;
  const Charts(this.recentTransaction, {super.key});
  get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(Object context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
          elevation: 6,
          margin: const EdgeInsets.all(20),
          color: Colors.blue,
          child: Row(
            children: groupTransactionValues.map((data) {
              return Text('${data['day']} : ${data['amount']}');
            }).toList(),
          )),
    );
  }
}
