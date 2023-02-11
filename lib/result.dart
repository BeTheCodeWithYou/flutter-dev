import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final int totalQuestions;
  final VoidCallback restartHandler;

  Result(this.resultScore, this.restartHandler, this.totalQuestions);

  String get resultPhrase {
    if (resultScore == totalQuestions) {
      return "All correct. You are awesome!";
    } else {
      return "You scored $resultScore out of $totalQuestions. Try again";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Text(resultPhrase,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),
      ElevatedButton(
        child: Text("Restart Quiz!", style: TextStyle(color: Colors.white)),
        onPressed: restartHandler,
      )
    ]));
  }
}
