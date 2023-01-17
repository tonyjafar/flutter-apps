import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _questions = [
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
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                _questions,
                _questionIndex,
                _answerQuestion,
              )
            : Result(),
      ),
    );
  }
}
