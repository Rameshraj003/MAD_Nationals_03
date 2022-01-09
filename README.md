# MAD Nationals 2022 Delhi: Quizzler

## Intro

Quizzler is an quiz app that tests your general knowledge. It has the following functionality:

- Show quiz with two choices for answers: True and False
- Allow selection to only one of the answers
- Based on the selected answer, evaluate the result
- If the answer was correct, show a green checkmark
- If the answer was incorrect, show a red cross
- After evaluation move to the next question
- If there are no more questions left, show the final score with pass/fail result
- Show top 100 random users with high scores on leaderboard screen

## Project Structure

The source code is present in the `lib` folder. It contains the following files:

- `main.dart` which acts as the entry point for the application and contain most of the UI logic and
  the setup code
- `question.dart` which is a model class used to represent a question
- `question_store.dart` which stores list of questions available for the quiz
- `quiz.dart` which contains logic for moving to next question, getting the current question, etc.
- `high_score_store.dart` which stores the last high score of the user and allows updation for the
  same
- `leaderboard.dart` which shows a random list of top 100 users along with their scores
- `pubspec.yaml` which is stored in the root of the project directory and defines app configuration and
  dependencies
