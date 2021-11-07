import 'package:flutter/material.dart';
import 'schedulePage.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class schedule2 extends StatefulWidget {
  @override
  _schedule2 createState() => _schedule2();
}

class _schedule2 extends State<schedule2> {
  var _labelText = 'Select Date';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2022),
    );

    if (selected != null) {
      setState(() {
        _labelText = (DateFormat.yMMMd()).format(selected);
      });
    }
  }

  // 入力された内容を保持するコントローラ
  final inputController = TextEditingController();

  final inputController2 = TextEditingController();
  // 表示用の変数
  String inputText = "最初の表示";
  var inputText2;
  int PageAmount = 0;
  var today = DateTime.now();
  // 入力されたときの処理
  void setText(String s) {
    setState(() {
      inputText = s;
    });
  }

  void setText2(var s) {
    setState(() {
      inputText2 = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      _labelText,
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: Icon(Icons.date_range),
                      onPressed: () => _selectDate(context),
                    )
                  ],
                ),
              ),
            ),
            // Column1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60.0),
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

                debugPrint("$inputText&$inputText2");
                int pien = int.parse(inputText2);

                pageNum.add(pien);
                workName.add(inputText);
                testDate.add(_labelText);
                int Numofwrok = workName.indexOf(inputText);

                //(DateFormat.yMMMd()).format(selected);
                debugPrint(
                    "${testDate[Numofwrok]}&&${pageNum[Numofwrok]}&&${workName[Numofwrok]}&&$_labelText&&$today");

                var dayPage = pageNum[Numofwrok]/7;
              },
              child: Text("登録"),
            ),

            Text("$inputText&$inputText2"),
          ],
        ),
      ),
    );
  }
}

List<int> pageNum = [];
List workName = [];
List testDate = [];
