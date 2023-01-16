import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var questions = [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        'balck',
        'red',
        'green',
        'white',
      ],
    },
    {
      'questionText': 'what\'s your favorite animal',
      'answers': [
        'dog',
        'cat',
        'rabbit',
        'cow',
      ],
    },
    {
      'questionText': 'what\'s your favorite City',
      'answers': [
        'Hamburg',
        'Munich',
        'London',
        'Berlin',
      ],
    },
  ];
  void _answerQuestion() {
    setState(() {
      if (_questionIndex >= questions.length - 1) {
        _questionIndex = 0;
      } else {
        _questionIndex += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
