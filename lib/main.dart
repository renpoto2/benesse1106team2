
import 'package:benesse1106team2/pages/testPage.dart';
import 'package:flutter/material.dart';

import 'pages/nigatePage.dart';
import 'pages/schedulePage.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNav',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  // ページインデックス保存用
  int _screen = 0;
  // 表示する Widget の一覧
  static List<Widget> _pageList = [
    scheduleScreen(),
    testScreen(),
    nigateSchreen()
  ];
  // ページ下部に並べるナビゲーションメニューの一覧
  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today_outlined,),
        label: 'スケジュール',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.border_color,),
        label: 'テスト',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.auto_stories,),
        label: 'ニガテ',
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar

      // ページビュー
      body: _pageList[_screen],
      // ページ下部のナビゲーションメニュー
      bottomNavigationBar: BottomNavigationBar(
        // 現在のページインデックス
        currentIndex: _screen,
        // onTapでナビゲーションメニューがタップされた時の処理を定義
        onTap: (index) {
          setState(() {
            // ページインデックスを更新
            _screen = index;
          });
        },
        // 定義済のナビゲーションメニューのアイテムリスト
        items: myBottomNavBarItems(),
      ),
    );
  }
}