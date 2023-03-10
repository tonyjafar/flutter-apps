import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _totalScore;
  final VoidCallback _resetApp;
  Result(this._totalScore, this._resetApp);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
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
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 25,
                  ),
                  foregroundColor: Colors.orange,
                  alignment: Alignment.center,
                  side: BorderSide(color: Colors.orange),
                ),
                onPressed: _resetApp,
                child: Text("Reset"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
