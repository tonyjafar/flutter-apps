import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _totalScore;
  final VoidCallback _resetApp;
  Result(this._totalScore, this._resetApp);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(100),
      child: Column(
        children: [
          _totalScore > 20
              ? Text(
                  "Congratulations Your Score is : " + _totalScore.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(
                  "Oh NO Your Score is : " + _totalScore.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ElevatedButton(
            onPressed: _resetApp,
            child: Text("Reset"),
          )
        ],
      ),
    );
  }
}
