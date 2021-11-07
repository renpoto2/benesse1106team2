// ignore: file_names
import 'package:benesse1106team2/pages/nigatePage.dart';
import 'package:benesse1106team2/pages/nigatePage2.dart';
import 'package:benesse1106team2/pages/testPage.dart';
import 'package:flutter/material.dart';
import 'package:benesse1106team2/pages/nigateAnswer.dart';
import 'package:benesse1106team2/pages/schedulePage.dart';


class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KBOYのFlutter大学'),
      ),
      body: Container(
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
    Question.name(' (Did, Was) Ms. Green watch TV yesterday?', true)
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
        backgroundColor: Colors.indigo[200],
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
              ),Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Center(
                  child: Text(
                    "次の(　　)内で正しいものを選びなさい",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
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
                          style: TextStyle(fontSize: 25.0,
                          ),
                        ),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: () => _checkAnswer(true, context),
                      color: Colors.indigo[300],
                      child: Text(
                        "Did",
                        style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: () => _checkAnswer(false, context),
                      color: Colors.indigo[300],
                      child: Text(
                        "Was",
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0),
                      ),
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
                child: RaisedButton(
                  child: Text('解説へ',
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),),
                  onPressed: () {
                    // ここにボタンを押した時に呼ばれるコードを書く
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NigateAncer()),
                    );
                  },
                  color: Colors.indigo[200],
                ),

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
                  child: RaisedButton(
                    child: Text('解説へ',
              style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0),),
                    onPressed: () {
                      // ここにボタンを押した時に呼ばれるコードを書く
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NigateAncer()),
                      );
                    },
                    color: Colors.indigo[200],
                  ),

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




