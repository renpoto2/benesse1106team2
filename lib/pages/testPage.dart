import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class testScreen extends StatefulWidget {
@override
_testScreen createState() => _testScreen();
}


class _testScreen extends State<testScreen> {
  // This widget is the root of your application.
  int _counter = 0;
  List<String>titleList = ['国語','数学','英語','理科','社会'];
  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        // Appbar
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          title: Text(
            'Subject',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: ListView.builder(
            itemCount: titleList.length,
            itemBuilder: (BuildContext context, int i){
              return Column(
                children: <Widget>[
                 ListTile(
                  onTap: (){

                  },
                   title:  Row(children: <Widget>[new Text(titleList[i],
                     style:  TextStyle(
                         fontWeight: FontWeight.w500, fontSize: 25.0),)
                   ], mainAxisAlignment: MainAxisAlignment.center,),

                ),
                Divider(thickness: 1,),
              ],
            );
          },
        ),
     );
  }
}
