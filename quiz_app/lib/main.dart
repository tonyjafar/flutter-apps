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
  var _totalScore = 0;
  var _questions = [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 0},
        {'text': 'Blue', 'score': 7},
        {'text': 'Red', 'score': 3},
      ],
    },
    {
      'questionText': 'what\'s your favorite animal',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 5},
        {'text': 'Eagle', 'score': 3},
        {'text': 'Snake', 'score': 0},
      ],
    },
    {
      'questionText': 'what\'s your favorite City',
      'answers': [
        {'text': 'Hamburg', 'score': 7},
        {'text': 'Berlin', 'score': 10},
        {'text': 'Munich', 'score': 3},
        {'text': 'London', 'score': 0},
      ],
    },
  ];
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  void _resetApp() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
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
            : Result(_totalScore, _resetApp),
      ),
    );
  }
}
