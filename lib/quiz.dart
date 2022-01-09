import 'package:Quizzler/question_store.dart';
import 'package:flutter/widgets.dart';

import 'question.dart';

class QuestionBank {
  QuestionStore _questionStore;

  QuestionBank(QuestionStore questionStore) {
    this._questionStore = questionStore;
  }

  int _questionNumber = 0;

  void nextQuestion() {
    if (!isQuizFinished()) {
      _questionNumber++;
    }
  }

  bool isQuizFinished() {
    if (_questionNumber == _questionStore.questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void resetQuestionNumber() {
    _questionNumber = 0;
  }

  int totalQuestionsInQuiz() {
    return _questionStore.questions.length;
  }

  Question getQuestion() {
    return _questionStore.questions[_questionNumber];
  }
}
