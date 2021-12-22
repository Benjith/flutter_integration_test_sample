import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_sample/login.dart';
import 'package:integration_test_sample/main.dart';
import 'package:integration_test_sample/second_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "Not inputting a text and wanting to go to the display page shows "
    "an error and prevents from going to the display page.",
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byType(LoginPage), findsOneWidget);
      expect(find.byType(SecondPage), findsNothing);
      expect(find.text('Input at least one character'), findsNWidgets(2));
    },
  );

  testWidgets(
    "After inputting a text, go to the display page which contains that text WELCOME "
    "and then navigate back to the typing page where the input should be clear",
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      final usernameTXT = 'benjith@gmail.com';
      final passwordTXT = 'qwerty';
      await tester.enterText(find.byKey(Key('usernameField')), usernameTXT);
      await tester.enterText(find.byKey(Key('passwordField')), passwordTXT);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(LoginPage), findsNothing);
      expect(find.byType(SecondPage), findsOneWidget);
      expect(find.text('Welcome'), findsOneWidget);

      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();

      expect(find.byType(TypingPage), findsOneWidget);
      expect(find.byType(DisplayPage), findsNothing);
      expect(find.text(usernameTXT), findsNothing);
    },
  );
}
