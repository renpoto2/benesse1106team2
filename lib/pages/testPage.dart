import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'questionPage.dart';


class testScreen extends StatefulWidget {
@override
_testScreen createState() => _testScreen();
}


class _testScreen extends State<testScreen> {
  // This widget is the root of your application.
  int _counter = 0;

  List<String>titleList = ['国語','数学','英語','理科','社会',];

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // Appbar
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          title: Text(
            '科目選択',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: ListView.builder(

            itemCount: titleList.length,
            itemBuilder: (BuildContext context, int i){
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                 ListTile(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionPage(titleList[i])));

                  },
                   title:  Row(children: <Widget>[Padding(
                     padding: const EdgeInsets.all(30.0),
                     child: Text(titleList[i],
                       style:  TextStyle(
                           fontWeight: FontWeight.w500,
                           fontSize: 40.0,
                          backgroundColor: Colors.white10,
                        ),
                     ),
                   )
                   ], mainAxisAlignment: MainAxisAlignment.center,),

                ),
              ],
            );
          },
        ),
     );
  }

}

