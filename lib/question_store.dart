import 'package:flutter/foundation.dart';

import 'question.dart';

//added keys to all questions
class QuestionStore {
  List<Question> questions = <Question>[
    Question(
      question: 'Some cats are actually allergic to humans',
      answer: true,
    ),
    Question(
      question: 'You can lead a cow down stairs but not up stairs.',
      answer: false,
    ),
    Question(
      question: 'Approximately one quarter of human bones are in the feet.',
      answer: true,
    ),
    Question(
      question: 'The hottest inhabited place in the world is in Dubai.',
      answer: false,
    ),
    Question(
      question: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
      answer: true,
    ),
    Question(
      question: 'Stop signs used to be yellow.',
      answer: true,
    ),
    Question(
      question:
          'No piece of square dry paper can be folded in half more than 7 times.',
      answer: false,
    ),
    Question(
      question:
          'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
      answer: true,
    ),
    Question(
      question:
          'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
      answer: false,
    ),
    Question(
      question:
          'The total surface area of two human lungs is approximately 70 square metres.',
      answer: true,
    ),
    Question(
      question: 'Google was originally called \"Backrub\".',
      answer: true,
    ),
    Question(
      question:
          'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
      answer: true,
    ),
    Question(
      question: 'Hot water will turn into ice faster than cold water.',
      answer: true,
    ),
  ];
}
