// ignore: file_names
import 'package:benesse1106team2/pages/nigatePage.dart';
import 'package:benesse1106team2/pages/nigatePage2.dart';
import 'package:benesse1106team2/pages/testPage.dart';
import 'package:flutter/material.dart';

import 'package:benesse1106team2/pages/schedulePage.dart';



class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("次のページ"),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.red,
      ),
    );
  }
}




class Question {
  String questionText;
  bool isCorrect;

  Question.name(this.questionText, this.isCorrect);

}

class QuiApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuiApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name('パンはパンでもだべられないパンはフランスパンである？', false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("苦手対策問題",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
        ),),
        centerTitle: true,
        backgroundColor: Colors.pink[100],
      ),

      // backgroundColor: Colors.blueGrey,

      // We use [Builder] here to use a [context] that is a descendant of [Scaffold]
      //or else [Scaffold.of] will return null
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Center(
                  child: Text(
                    "問題",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 120.0),
                child: Container(
                  margin: EdgeInsets.all(100),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid,)),
                  height: 120.0,
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          questionBank[_currentQuestionIndex].questionText,
                          style: TextStyle(fontSize: 16.9,
                          ),
                        ),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "○",
                      style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "✕",
                      style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
      debugPrint("Index: $_currentQuestionIndex");
    });
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      //correct answer


      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
              title: Center(child: Text("正解！")),
              children: <Widget>[
              // コンテンツ領域
              SimpleDialogOption(
              onPressed: () => Navigator.pop(context), //遷移先指定場所
          child: Center(child: Text("解説へ！")),
          ),
          ],
          );
        },
      );



    } else {


      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Center(child: Text("不正解！")),
            children: <Widget>[
              // コンテンツ領域
              SimpleDialogOption(
                onPressed: () => Navigator.pop(context), //遷移先指定場所
                child: Center(child: Text("解説へ！")),
              ),
            ],
          );
        },
      );


    }


  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }
}




