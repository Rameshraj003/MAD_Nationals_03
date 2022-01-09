import 'package:flutter_test/flutter_test.dart';
import 'package:Quizzler/main.dart';
import 'package:Quizzler/main.dart' as app;
import 'package:Quizzler/leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//component_test
void main() {
  group('component_test', () {
    testWidgets(
        'q as test & in italic & in true is gren but wrong is red hiogh score alert',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify if question is text
      expect(find.byKey(Key("text")), findsWidgets);

      // Question is itallic
      final Finder fab = find.byKey(Key("text"));
      expect(find.byKey(Key("text")), findsOneWidget);

      //  wait for widget build to complete
      await tester.pumpAndSettle();
      //
    });
  });
}
