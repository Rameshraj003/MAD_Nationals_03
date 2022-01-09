import 'package:flutter_test/flutter_test.dart';
import 'package:Quizzler/main.dart';
import 'package:Quizzler/main.dart' as app1;
import 'package:Quizzler/leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:Quizzler/question_store.dart' as app;
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';

//app_test
void main() {
  group('unit testing', () {
    testWidgets('true false button check', (WidgetTester tester) async {
      app.QuestionStore;
      await tester.pumpAndSettle();

      // Verify if qno increases
      expect(find.byKey(Key("true")), findsOneWidget);

      // find the button using key
      final Finder fab = find.byKey(Key("true"));

// tap the button true
      await tester.tap(fab);

      await tester.pumpAndSettle();
      // find the button using key

      expect(find.byKey(Key("true")), findsOneWidget);
      // find the button using key

      final Finder fab1 = find.byKey(Key("false"));
      // tap the button false

      await tester.tap(fab1);

      // wait for widget creating to complete
      await tester.pumpAndSettle();
    });
  });
}
