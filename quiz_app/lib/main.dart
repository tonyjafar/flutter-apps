import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var questions = [
      'what\'s your favorite color?',
      'what\'s you faorite animal?'
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Text('The question!'),
            ElevatedButton(
              onPressed: null,
              child: Text('Answer 1'),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text('Answer 2'),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text('Answer 3'),
            ),
          ],
        ),
      ),
    );
  }
}
