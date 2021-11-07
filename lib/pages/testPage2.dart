import 'package:flutter/material.dart';
import 'package:benesse1106team2//widget/result_page.dart';
import './utils/constants.dart';
import './widget/answer_button.dart';
import './widget/question_view.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// 問題文のindex
  var _questionIndex = 0;
  /// 問題
  var _questions = [
    {
      'question':
      'The weather in Merizo is very (x) year-round, though there are showers almost daily from December through March.',
      'a': 'agreeable',
      'b': 'agree',
      'c': 'agreement',
      'd': 'agreeably',
      'correctAnswer': 'A'
    },
    {
      'question':
      '(x) for the competition should be submitted by November 28 at the latest.',
      'a': 'Enter',
      'b': 'Entered',
      'c': 'Entering',
      'd': 'Entries',
      'correctAnswer': 'D'
    }
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
  }

  void _resetIndex() {
    setState(() {
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文法問題'),
      ),
      body: Center(
        child: _questionIndex < _questions.length ? Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: Constants().questionAreaHeight,
              color: Colors.red,
              child: Center(
                child: Text(
                  '(x)に入る単語を答えよ。',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              height: Constants().questionAreaHeight,
              color: Colors.green,
              child: Center(
                child: Text(
                  'Q${_questionIndex + 1}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            QuestionView(questionIndex: _questionIndex, questions: _questions),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnswerButton(
                        questions: _questions,
                        questionIndex: _questionIndex,
                        answerQuestion: _answerQuestion,
                        keyString: 'a'),
                    AnswerButton(
                        questions: _questions,
                        questionIndex: _questionIndex,
                        answerQuestion: _answerQuestion,
                        keyString: 'b'),
                    AnswerButton(
                        questions: _questions,
                        questionIndex: _questionIndex,
                        answerQuestion: _answerQuestion,
                        keyString: 'c'),
                    AnswerButton(
                        questions: _questions,
                        questionIndex: _questionIndex,
                        answerQuestion: _answerQuestion,
                        keyString: 'd'),
                  ],
                ),
              ),
            )
          ],
        ) : ResultPage(_resetIndex),
      ),
    );
  }
}