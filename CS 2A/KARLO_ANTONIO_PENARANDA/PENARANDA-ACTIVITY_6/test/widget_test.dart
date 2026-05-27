// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:activity_6_profile_pet/main.dart';

void main() {
  testWidgets('shows home and profile screens through bottom navigation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('My Pet'), findsOneWidget);
    expect(find.text('Ganda'), findsOneWidget);
    expect(find.text('Play Bark'), findsOneWidget);

    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();

    expect(find.text(studentProfile.fullName), findsWidgets);
    expect(find.text('My Biography'), findsOneWidget);
    expect(find.text('Hobbies'), findsOneWidget);
  });
}
