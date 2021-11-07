import 'package:flutter/material.dart';

import 'resultPage.dart';


class QuestionPage extends StatefulWidget {
  QuestionPage(String titleList);



  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  List<String> questions = [
    '第1問・・・\nベルリンの壁は東ドイツと西ドイツの国境沿いにあった。',
    '第2問・・・\n千葉県と茨城県。面積が大きいのは、九十九里浜のある千葉県である。',
    '第3問・・・\n新選組の初代筆頭局長は、近藤勇（こんどう いさみ）である。',
    '第4問・・・\n明治初期の日本のお札（紙幣）に紫式部の肖像が使用されたことがある。',
  ];

  List<bool> answers = [
    false,
    false,
    false,
    false,
  ];

  int questionNumber = 0;
  int numberOfCorrectAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          title: Text(
            '問題',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.10),
                child: Text(
                  questions[questionNumber],
                  style: TextStyle(
                  fontSize: 40.0,
                  ),
                ),
              ),
            ),
            Expanded(

              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: (){
                    bool correctAnswer = answers[questionNumber];
                    if (correctAnswer == true){
                      numberOfCorrectAnswer++;
                      print(numberOfCorrectAnswer);
                    }
                    if(questionNumber + 1 < questions.length){
                      setState(() {
                         questionNumber++;
                        });
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Result(numberOfCorrectAnswer: numberOfCorrectAnswer),
                          ),
                            );
                    }
                  },
                  child: Text(
                    '○',
                    style: TextStyle(
                    fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amberAccent,
                    onPrimary: Colors.cyan,
                    fixedSize: Size(500, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      )
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                    onPressed: (){
                      bool correctAnswer = answers[questionNumber];
                      if (correctAnswer == false){
                      numberOfCorrectAnswer++;
                      }
                      if(questionNumber + 1 < questions.length){
                        setState(() {
                          questionNumber++;
                          print(numberOfCorrectAnswer);
                        });
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Result(numberOfCorrectAnswer: numberOfCorrectAnswer),
                          ),
                            );
                       }
                      },


                    child: Text(
                      '✘',
                      style: TextStyle(
                      fontSize: 60.0,
                      ),
                    ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amberAccent,
                    onPrimary: Colors.cyan,
                    fixedSize: Size(500, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      )
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
