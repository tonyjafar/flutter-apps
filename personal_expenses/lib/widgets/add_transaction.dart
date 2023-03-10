import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function addTransaction;
  final double appBarHeight;
  const AddTransaction(this.addTransaction, this.appBarHeight, {super.key});

  @override
  State<StatefulWidget> createState() {
    return AddTransactionState();
  }
}

class AddTransactionState extends State<AddTransaction> {
  final _amount = TextEditingController();
  final _title = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final enteredTitle = _title.text;
    num enteredAmount;
    try {
      enteredAmount = double.parse(_amount.text);
    } catch (_) {
      enteredAmount = 0;
      _amount.clear();
      _title.clear();
    }

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    _selectedDate ??= DateTime.now();

    widget.addTransaction(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    _amount.clear();
    _title.clear();
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((pickedDate) => {
          if (pickedDate != null) {setDate(pickedDate)}
        });
  }

  void setDate(appDate) {
    setState(() {
      _selectedDate = appDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                controller: _title,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
                controller: _amount,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onSubmitted: (_) => _submitData(),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        widget.appBarHeight -
                        MediaQuery.of(context).padding.top) *
                    0.09,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : DateFormat.yMd()
                              .format((_selectedDate) as DateTime),
                    ),
                    TextButton(
                      onPressed: () => _presentDatePicker(),
                      child: const Text(
                        'Choose Day',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => _submitData(),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(10),
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
  }
}
