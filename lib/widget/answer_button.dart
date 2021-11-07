import 'package:flutter/material.dart';
import 'package:benesse1106team2/utils/hex_color.dart';
import '../utils/constants.dart';

class AnswerButton extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final Function incrementCorrect;
  final String keyString;

  AnswerButton({
    this.questionIndex,
    this.questions,
    this.answerQuestion,
    this.incrementCorrect,
    this.keyString
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Constants().answerButtonHeight / 2),
      child: SizedBox(
          width: double.infinity,
          height: Constants().answerButtonHeight,
          child: RaisedButton(
            color: HexColor('#D6D7D7'),
            child: Text(questions[questionIndex][keyString]),
            onPressed: () {
              /// "b".toUpperCase() == "D" みたいな感じ
              if (keyString.toUpperCase() == questions[questionIndex]["correctAnswer"].toString()) {
                incrementCorrect();
              }
              answerQuestion();
            },
          )),
    );
  }
}