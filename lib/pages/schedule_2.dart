import 'package:flutter/material.dart';

class schedule2 extends StatefulWidget {
  @override
  _schedule2 createState() => _schedule2();
}

class _schedule2 extends State<schedule2> {
  // 入力された内容を保持するコントローラ
  final inputController = TextEditingController();

  final inputController2 = TextEditingController();
  // 表示用の変数
  String inputText = "最初の表示";
  String inputText2 = "ページ数を入力";
  int PageAmount = 0;
  // 入力されたときの処理
  void setText(String s) {
    setState(() {
      inputText = s;
    });
  }

  void setText2(String s) {
    setState(() {
      inputText2 = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Column1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 100,
                      height: 100,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'ワークの名前'),
                        enabled: true, //活性or非活性
                        style: TextStyle(color: Colors.red), //入力文字のスタイル
                        obscureText: false, //trueでマスク（****表記）にする
                        maxLines: 1, //入力可能行数
                        controller: inputController,
                      ),
                    )),
              ),
              Container(
                  child: Container(
                width: 100,
                height: 100,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'ページ数'),
                  enabled: true, //活性or非活性
                  //入力最大文字数
                  style: TextStyle(color: Colors.red), //入力文字のスタイル
                  obscureText: false, //trueでマスク（****表記）にする
                  maxLines: 1, //入力可能行数
                  controller: inputController2,
                ),
              ))
            ],
          ),
          // Column2
          GestureDetector(
            onTap: () {
              setText(inputController.text);
              setText2(inputController2.text);
              int.parse(inputText2);
              debugPrint("$inputText&$inputText2");
              pageNum.add(inputText2);
              workName.add(inputText);
              debugPrint("${pageNum[0]}&&${workName[0]}");
            },
            child: Text("入力が終わったら押してみて"),
          ),

          Text("$inputText&$inputText2"),
        ],
      ),
    );
  }
}

List pageNum = [];
List workName = [];
