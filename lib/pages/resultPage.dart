import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'testPage.dart';

class Result extends StatelessWidget {

  final int numberOfCorrectAnswer;
  Result({required this.numberOfCorrectAnswer});

  Widget resultWords() {
    if(numberOfCorrectAnswer < 2){
      return Center(
        child: Text('平均点',
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
         ),
        ),
      );
    }else {
      return Center(
        child: Text('平均超え！',
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.blue[100],
      title: Text(
        '結果',
        style: TextStyle(fontSize: 20),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
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
                    fontSize:50.0,
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
                  Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => testScreen(),
                      ),
                  );
                },
                child: Text('科目選択に戻る', style: TextStyle(
                    fontSize: 30.0,
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

