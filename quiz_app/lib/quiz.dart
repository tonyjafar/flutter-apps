import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int _questionIndex;
  final void Function(int) _answerQuestion;
  Quiz(
    this.questions,
    this._questionIndex,
    this._answerQuestion,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Question(
            questions[_questionIndex]['questionText'] as String,
          ),
          ...(questions[_questionIndex]['answers'] as List<Map>).map((answer) {
            return Answer(
                () => _answerQuestion(answer['score']), answer['text']);
          }).toList(),
        ],
      ),
    );
  }
}
