import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function addTransaction;
  const AddTransaction(this.addTransaction, {super.key});

  @override
  State<StatefulWidget> createState() {
    return AddTransactionState();
  }
}

class AddTransactionState extends State<AddTransaction> {
  final amount = TextEditingController();
  final title = TextEditingController();

  void submitData() {
    final enteredTitle = title.text;
    num enteredAmount;
    try {
      enteredAmount = double.parse(amount.text);
    } catch (_) {
      enteredAmount = 0;
      amount.clear();
      title.clear();
    }

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTransaction(
      enteredTitle,
      enteredAmount,
    );
    amount.clear();
    title.clear();
    Navigator.of(context).pop();
  }

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
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  const Text('No Date Chosen!'),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Choose Day',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => submitData(),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                  Colors.white,
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
