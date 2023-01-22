import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final amount = TextEditingController();
  final title = TextEditingController();
  final Function addTransaction;
  AddTransaction(this.addTransaction, {super.key});
  @override
  Widget build(Object context) {
    return Card(
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
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              controller: amount,
            ),
            TextButton(
              onPressed: () => addTransaction(
                title.text,
                double.parse(amount.text),
              ),
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
    );
  }
}
