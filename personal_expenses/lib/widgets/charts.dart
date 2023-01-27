import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';

class Charts extends StatelessWidget {
  final List<Transaction> recentTransaction;
  const Charts(this.recentTransaction, {super.key});
  List<Map<String, Object>> get groupTransactionValues {
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

  double get totalSPending {
    return groupTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  @override
  Widget build(Object context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'].toString(),
                (data['amount'] as double),
                totalSPending == 0
                    ? 0.0
                    : ((data['amount'] as double) / totalSPending),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
