import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gaz/main.dart';

void main() {
  group('MyApp Widget Test', () {
    testWidgets('renders without crashing', (WidgetTester tester) async {
      // Build the app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that the app starts without errors
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('has correct title', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const MyApp());
      
      // Find MaterialApp widget and verify title
      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      expect(app.title, 'Gaz Distribution App');
    });

    testWidgets('debug banner is disabled', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const MyApp());
      
      // Find MaterialApp widget and verify debug banner is disabled
      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      expect(app.debugShowCheckedModeBanner, false);
    });
  });
}