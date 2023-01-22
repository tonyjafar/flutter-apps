import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final amount = TextEditingController();
  final title = TextEditingController();
  final Function addTransaction;
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

    addTransaction(
      enteredTitle,
      enteredAmount,
    );
  }

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
    );
  }
}
