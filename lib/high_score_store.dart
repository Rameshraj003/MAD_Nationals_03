class HighScoreStore {
  int _lastHighScore = 0;

  bool updateHighScore(int score) {
    if (score > _lastHighScore) {
      _lastHighScore = score;
      return true;
    } else {
      return false;
    }
  }
}
