// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:community_care/main.dart';

void main() {
  testWidgets('Renders MyApp', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(CommunityCareApp());

    // Verify that the title text is present.
    expect(find.text('CommunityCare'), findsOneWidget);

    // Replace the below lines with your actual widget testing logic
    // Example: expect(find.text('YourWidgetText'), findsOneWidget);

    // You can add more test cases as needed.
  });
}