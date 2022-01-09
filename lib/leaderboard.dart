import 'dart:math';

import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  static String routeName = '/leaderboard';

  @override
  Widget build(BuildContext context) {
    List<HighScore> scores = HighScore.generateHighScores();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      body: ListView.builder(
        itemCount: scores.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(scores[index]),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final HighScore score;

  const ItemTile(this.score, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          score.user,
          key: Key('text_${score.user}'),
        ),
        trailing: Text(
          score.score.toString(),
          key: Key('text_${score.score}'),
        ),
      ),
    );
  }
}

class HighScore {
  String user;
  int score;

  HighScore(String user, int score) {
    this.user = user;
    this.score = score;
  }

  static List<HighScore> generateHighScores() {
    return List.generate(100, (index) {
      Random randomScore = new Random();
      int score = randomScore.nextInt(14);
      String name = "John Doe $index";

      return HighScore(name, score);
    });
  }
}
