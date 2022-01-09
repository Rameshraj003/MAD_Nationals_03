import 'package:Quizzler/leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'high_score_store.dart';
import 'question_store.dart';
import 'quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        QuizzlerPage.routeName: (context) => QuizzlerPage(),
        Leaderboard.routeName: (context) => Leaderboard(),
      },
      initialRoute: QuizzlerPage.routeName,
    );
  }
}

class QuizzlerPage extends StatefulWidget {
  static String routeName = '/';

  QuizzlerPage({Key key}) : super(key: key);

  @override
  _QuizzlerPageState createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<QuizzlerPage> {
  List<Widget> scoreKeeper = <Icon>[];
  HighScoreStore scoreStore = HighScoreStore();
  QuestionBank quiz = QuestionBank(QuestionStore());
  int correctQuestions = 0;

  void alert(context, bool isNewHighScore) {
    int totalQuestions = quiz.totalQuestionsInQuiz();
    AlertType alertType;
    String desc;
    String highScoreDes = '';

    if (isNewHighScore) {
      highScoreDes = "\nYou set a new high score!";
    }

    if (correctQuestions > totalQuestions / 2) {
      alertType = AlertType.success;
      desc = 'Congratulations! You have passed the quiz.$highScoreDes';
    } else {
      alertType = AlertType.error;
      desc =
          'You failed the quiz but don\'t worry. You can try again now.$highScoreDes';
    }
    Alert(
        id: "quiz_result",
        context: context,
        type: alertType,
        title: 'Score: $correctQuestions/$totalQuestions',
        desc: desc,
        style: AlertStyle(
          animationType: AnimationType.grow,
          animationDuration: Duration(
            milliseconds: 550,
          ),
          isOverlayTapDismiss: false,
          overlayColor: Colors.black,
        ),
        buttons: [
          DialogButton(
            child: Text('View Leaderboard'),
            onPressed: () =>
                Navigator.pushNamed(context, Leaderboard.routeName),
          ),
        ]).show();
  }

  void evaluateResult(bool answer) {
    if (quiz.getQuestion().answer == answer) {
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
      correctQuestions++;
    } else {
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
    if (!quiz.isQuizFinished()) {
      Key("increment");
      quiz.nextQuestion();
    } else {
      bool isNewHighScore = scoreStore.updateHighScore(correctQuestions);
      alert(context, isNewHighScore);
      quiz.resetQuestionNumber();
      scoreKeeper = [];
      correctQuestions = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    quiz.getQuestion().question,
                    key: Key("text"),
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 10.0,
                  ),
                  child: FlatButton(
                    key: Key("true"),
                    onPressed: () {
                      setState(() {
                        evaluateResult(true);
                      });
                    },
                    color: Colors.green,
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 10.0,
                  ),
                  child: FlatButton(
                    key: Key("false"),
                    onPressed: () {
                      setState(() {
                        evaluateResult(false);
                      });
                    },
                    color: Colors.red,
                    child: Text(
                      'False',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: scoreKeeper,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
