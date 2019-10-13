import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _question = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answer': [
        {'text': 'Pink', 'score': 8},
        {'text': 'Blue', 'score': 7},
        {'text': 'White', 'score': 1},
        {'text': 'Beige', 'score': 3}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal',
      'answer': [
        {'text': 'fish', 'score': 8},
        {'text': 'giraffe', 'score': 6},
        {'text': 'lion', 'score': 4},
        {'text': 'dog', 'score': 2}
      ]
    },
    {
      'questionText': 'What\'s is your favorite dish',
      'answer': [
        {'text': 'soushi', 'score': 2},
        {'text': 'Fish&Chips', 'score': 4},
        {'text': 'Tzatziki', 'score': 6},
        {'text': 'Pizza', 'score': 8}
      ]
    }
  ];
  int _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
    
  }


  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    if (_questionIndex < _question.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _question.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  question: _question,
                )
              : Result(_totalScore, _resetQuiz),),
    );
  }
}
