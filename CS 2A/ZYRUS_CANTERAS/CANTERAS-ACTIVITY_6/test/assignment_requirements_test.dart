import 'package:flutter_test/flutter_test.dart';
import 'package:unit6_assignment/main.dart';

void main() {
  test('profile contains at least five information sections', () {
    expect(ProfileScreen.details.length, greaterThanOrEqualTo(5));
  });

  testWidgets('app provides profile and pet navigation', (tester) async {
    await tester.pumpWidget(const Unit6App());

    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Pet'), findsOneWidget);
    expect(find.text('My Biography'), findsOneWidget);
  });
}
