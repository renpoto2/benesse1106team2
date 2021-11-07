import 'package:benesse1106team2/pages/nigatePage2.dart';
import 'package:flutter/material.dart';

class nigateScreen extends StatefulWidget {
  @override
  _nigateScreen createState() => _nigateScreen();
}




class _nigateScreen extends State<nigateScreen> {
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
        backgroundColor: Colors.indigo[200],
        title: Text(
          'Weak Point ＜科目選択＞',
          style: TextStyle(fontSize: 40),
        ),
      ),
      body: ListView.builder(

        itemCount: titleList.length,
        itemBuilder: (BuildContext context, int i){
          return Container(
            decoration: new BoxDecoration(
              border: new Border(
                bottom: new BorderSide(color: Colors.black),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context) => QuiApp()));

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
            ),
          );
        },
      ),
    );
  }

}
