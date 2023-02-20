import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Which of the following is not a greenhouse gas?',
      'answers': [
        {'text': 'Carbon dioxide', 'score': 0},
        {'text': 'Methane', 'score': 0},
        {'text': 'Hilium', 'score': 1},
        {'text': 'Nitrous Oxide', 'score': 0}
      ]
    },
    {
      'questionText': 'Which type of water can hold more Carbon dioxide?',
      'answers': [
        {'text': 'Hot Water', 'score': 0},
        {'text': 'Cold Water', 'score': 1}
      ]
    },
    {
      'questionText':
          'Wasting less food is a way to reduce greenhouse gas emissions?',
      'answers': [
        {'text': 'True', 'score': 1},
        {'text': 'False', 'score': 0}
      ]
    },
    {
      'questionText':
          'As the ocean gets warmer, would it cause more hurricanes?',
      'answers': [
        {'text': 'True', 'score': 1},
        {'text': 'False', 'score': 0}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _restartQuiz() {
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
              title: Text("First App"),
            ),
            body: _questionIndex < _questions.length
                ? Quiz(
                    questions: _questions,
                    questionIndex: _questionIndex,
                    answerQuestion: _answerQuestion,
                  )
                : Result(_totalScore, _restartQuiz, _questions.length)));
  }
}
