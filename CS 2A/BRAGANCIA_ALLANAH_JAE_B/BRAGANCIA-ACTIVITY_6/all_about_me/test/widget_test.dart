import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:all_about_me/main.dart';

void main() {
  testWidgets('App loads smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AllAboutMeApp());

    // Verify that the bottom navigation bar is present
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}
