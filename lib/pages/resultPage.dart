import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'testPage.dart';


class Result extends StatelessWidget {

  final int numberOfCorrectAnswer;
  Result({required this.numberOfCorrectAnswer});

  Widget resultWords() {
    if(numberOfCorrectAnswer < 2){
      return Center(
        child: Text('あと${70-numberOfCorrectAnswer*25}点 がんばろう',
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
         ),
        ),
      );
    }else {
      return Center(
        child: Text('合格点!',
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.indigo.shade200,
      title: Text(
        'Result',
        style: TextStyle(fontSize: 40),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                  child: Text(
                    '4問中$numberOfCorrectAnswer問正解',
                    style: TextStyle(
                      fontSize:30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ),
            ),
            Center(
                child: Text(
                  '${numberOfCorrectAnswer*25}点',
                  style: TextStyle(
                    fontSize:70.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            resultWords(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0,
                vertical: 20.0,
              ),
              child: ElevatedButton(
                onPressed: (){
                  int count = 0;
                  Navigator.popUntil(context, (_) => count++ >= 2);

                  },
                child: Text('科目選択にもどる', style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo.shade300,
                  fixedSize: const Size(300, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

