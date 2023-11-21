// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:community_care/main.dart';

void main() {
  testWidgets('Test your app widgets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // You can add test cases here to check if certain widgets are present,
    // interact with them, and make assertions about the state of the app.

    // For example:
    expect(find.text('Neighborly Assistance Hub'), findsOneWidget);

    // You can add more test cases based on your UI elements.

    // Example of interacting with a widget:
    // await tester.tap(find.byType(YourWidgetType));
    // await tester.pump();

    // Example of making an assertion about the state of the app:
    // expect(find.text('Expected Text'), findsOneWidget);
  });
}