import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gaz/src/auth/screens/signup.dart';

void main() {
  group('SignupPage Widget Test', () {
    testWidgets('renders all UI elements correctly', (
      WidgetTester tester,
    ) async {
      // Build the signup page widget
      await tester.pumpWidget(const MaterialApp(home: SignupPage()));

      // Verify key UI elements are present
      expect(find.text('Create'), findsOneWidget);
      expect(find.text('Account'), findsOneWidget);
      expect(find.text('Enter Your Details'), findsOneWidget);
      expect(find.text('Already have an account ?'), findsOneWidget);

      // Check if form fields are present
      expect(find.widgetWithText(TextFormField, 'Name'), findsOneWidget);
      expect(
        find.widgetWithText(TextFormField, 'Phone Number'),
        findsOneWidget,
      );
    });
  });
}
