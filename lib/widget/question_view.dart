import 'package:flutter/material.dart';

class QuestionView extends StatelessWidget {
  /// 問題文のidかindexを渡す想定
  final int questionIndex;
  /// 問題文オブジェクト
  final List<Map<String, Object>> questions;

  QuestionView({@required this.questionIndex, @required this.questions});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            questions[questionIndex]['question'],
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}