import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Q1',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              Container(
                height: 70,
                color: Colors.red,
                child: Center(
                  child: Text(
                    '問題文',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              Container(
                color: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      '答え',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.orangeAccent,
                height: 70,
                child: Center(
                  child: Text(
                    '解説文',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              RaisedButton(
                child: const Text('戻る'),
                color: Colors.orange,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
