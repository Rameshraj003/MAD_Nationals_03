import 'package:flutter/src/foundation/key.dart';

class Question {
  String question;
  bool answer;

  Question({String question, bool answer, Key key}) {
    this.question = question;
    this.answer = answer;
  }
}
