import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:neighborly_assistance_hub/main.dart';

void main() {
  testWidgets('Widget Test for Neighborly Assistance Hub App', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the app contains the title in the app bar.
    expect(find.text('Neighborly Assistance Hub'), findsOneWidget);

    // Verify that the app contains the logo.
    expect(find.byType(Image), findsOneWidget);

    // Verify that the app contains the search text.
    expect(find.text('Search for...'), findsOneWidget);

    // Verify that the app contains the first task in the task list.
    expect(find.text('Grocery Shopping'), findsOneWidget);

    // Verify that the app contains the second task in the task list.
    expect(find.text('Yard Work'), findsOneWidget);

    // Verify that the app contains the bottom navigation bar.
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}
