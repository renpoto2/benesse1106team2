import 'package:flutter/material.dart';

import 'nigatePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
            title: Text(
          "解説",
          style: TextStyle(fontSize: 60),
        )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 70,
                color: Colors.greenAccent,
                child: Center(
                  child: Text(
                    'Q1',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              Container(
                color: Colors.redAccent,
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
                color: Colors.yellowAccent,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      '答え : Did',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.orangeAccent,
                child: Center(
                  child: Text(
                    '“Yes / No” で答えられる疑問文は、be動詞がある場合、be動詞を文章の先頭にもってきますが一般動詞の場合には “Does” や “Do”、”Did” が文頭で使われ、あとの語順は肯定文のままで動詞は原型になります。',
                    style: TextStyle(fontSize: 40),
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
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios),
                      color: Colors.pinkAccent,
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
