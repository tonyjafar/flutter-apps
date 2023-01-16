import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback funcName;
  final String answerText;
  Answer(this.funcName, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: funcName,
        child: Text(answerText),
      ),
    );
  }
}
