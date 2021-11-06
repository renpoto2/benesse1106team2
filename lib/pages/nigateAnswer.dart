import 'package:flutter/material.dart';



class NigateAncer extends StatelessWidget {
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
                height: 70,
                color: Colors.redAccent,
                child: Center(
                  child: Text(
                    '問題文',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              Container(
                color: Colors.yellowAccent,
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
                        Navigator.pop(context);
                      },
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
