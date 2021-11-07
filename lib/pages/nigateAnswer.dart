import 'package:flutter/material.dart';


import 'nigatePage.dart';





class NigateAncer extends StatelessWidget {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.indigo[200],
            title: Text(
          "解説",
          style: TextStyle(fontSize: 40, ),
        )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 70,
                color: Colors.indigo[300],
                child: Center(
                  child: Text(
                    'Q1',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: const Border(
                    bottom: const BorderSide(
                      color: Colors.indigo,
                      width: 3,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      '(Did, Was) Ms. Green watch TV yesterday?',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: const Border(
                    bottom: const BorderSide(
                      color: Colors.indigo,
                      width: 3,
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      '答え : Did',
                      style: TextStyle(fontSize: 40,  fontWeight: FontWeight.bold, color:Colors.red,),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: const Border(
                    bottom: const BorderSide(
                      color: Colors.indigo,
                      width: 3,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    '“Yes / No” で答えられる疑問文は、be動詞がある場合、be動詞を文章の先頭にもってきますが一般動詞の場合には “Does” や “Do”、”Did” が文頭で使われ、あとの語順は肯定文のままで動詞は原型になります。',
                    style: TextStyle(fontSize: 40, ),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.check_outlined),
                      color: Colors.greenAccent,
                      iconSize: 64,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.clear_outlined),
                      color: Colors.redAccent,
                      iconSize: 64,
                    ),
                    IconButton(
                        onPressed: () {
                          int count = 0;
                          Navigator.popUntil(context, (_) => count++ >= 3);

                        },
                      icon: Icon(Icons.arrow_forward_ios),
                      color: Colors.indigo[200],
                      iconSize: 64,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
