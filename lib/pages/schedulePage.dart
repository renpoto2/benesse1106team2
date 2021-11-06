import 'schedule_2.dart';
import 'package:flutter/material.dart';

class scheduleScreen extends StatefulWidget{
  @override
  _scheduleScreen createState() => _scheduleScreen();

}

class _scheduleScreen extends State<scheduleScreen>   {
  var list = ["メッセージ", "メッセージ", "メッセージ", "メッセージ", "メッセージ",];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        // Appbar
        appBar: AppBar(

          backgroundColor: Colors.green[100],
          title: Text(
            'Book',
            style: TextStyle(fontSize: 16),
          ),
          actions: [IconButton(onPressed: (){
            // （1） 指定した画面に遷移する
            Navigator.push(context, MaterialPageRoute(
              // （2） 実際に表示するページ(ウィジェット)を指定する
                builder: (context) => schedule2()
            ));
          }, icon:Icon(Icons.face, color: Colors.white,),
          )
          ],
        ),
        body: Column(
          children: [
            Text("data")


          ],
        ),

    );
  }

 
}