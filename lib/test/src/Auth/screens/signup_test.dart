import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gaz/src/Auth/screens/login.dart';
import 'package:gaz/src/Auth/screens/otp.dart';
import 'package:gaz/src/Auth/screens/signup.dart';
void main() {
  group('SignupPage Widget Test', () {
    testWidgets('renders all UI elements correctly', (WidgetTester tester) async {
      // Build the signup page widget
      await tester.pumpWidget(const MaterialApp(home: SignupPage()));
      
      // Verify key UI elements are present
      expect(find.text('Create'), findsOneWidget);
      expect(find.text('Account'), findsOneWidget);
      expect(find.text('Enter Your Details'), findsOneWidget);
      expect(find.text('Already have an account ?'), findsOneWidget);
      
      // Check if form fields are present
      expect(find.widgetWithText(TextFormField, 'Name'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Phone Number'), findsOneWidget);
    });

    testWidgets('validates empty name field', (WidgetTester tester) async {
      // Build the signup page widget
      await tester.pumpWidget(const MaterialApp(home: SignupPage()));
      
      // Find the form fields
      final nameField = find.ancestor(
        of: find.text('Name'),
        matching: find.byType(TextFormField),
      );
      
      // Tap arrow button without filling the form
      final arrowButton = find.byType(IconButton);
      await tester.tap(arrowButton);
      await tester.pump();
      
      // Verify error message is shown
      expect(find.text('Please enter your name'), findsOneWidget);
    });

    testWidgets('validates empty phone number field', (WidgetTester tester) async {
      // Build the signup page widget
      await tester.pumpWidget(const MaterialApp(home: SignupPage()));
      
      // Find the name field and fill it
      final nameField = find.ancestor(
        of: find.text('Name'),
        matching: find.byType(TextFormField),
      );
      await tester.enterText(nameField, 'Test User');
      
      // Tap arrow button without filling phone number
      final arrowButton = find.byType(IconButton);
      await tester.tap(arrowButton);
      await tester.pump();
      
      // Verify error message is shown
      expect(find.text('Please enter your phone number'), findsOneWidget);
    });

    testWidgets('validates invalid phone number', (WidgetTester tester) async {
      // Build the signup page widget
      await tester.pumpWidget(const MaterialApp(home: SignupPage()));
      
      // Find and fill the name field
      final nameField = find.ancestor(
        of: find.text('Name'),
        matching: find.byType(TextFormField),
      );
      await tester.enterText(nameField, 'Test User');
      
      // Find and fill the phone number field with invalid number
      final phoneField = find.ancestor(
        of: find.text('Phone Number'),
        matching: find.byType(TextFormField),
      );
      await tester.enterText(phoneField, '123');
      
      // Tap arrow button
      final arrowButton = find.byType(IconButton);
      await tester.tap(arrowButton);
      await tester.pump();
      
      // Verify error message is shown
      expect(find.text('Please enter a valid phone number'), findsOneWidget);
    });

    testWidgets('navigates to OTP page when form is valid', (WidgetTester tester) async {
      // Build the signup page widget
      await tester.pumpWidget(MaterialApp(
        routes: {
          '/': (context) => const SignupPage(),
        },
      ));
      
      // Find and fill the name field
      final nameField = find.ancestor(
        of: find.text('Name'),
        matching: find.byType(TextFormField),
      );
      await tester.enterText(nameField, 'Test User');
      
      // Find and fill the phone number field
      final phoneField = find.ancestor(
        of: find.text('Phone Number'),
        matching: find.byType(TextFormField),
      );
      await tester.enterText(phoneField, '1234567890');
      
      // Tap arrow button
      final arrowButton = find.byType(IconButton);
      await tester.tap(arrowButton);
      await tester.pumpAndSettle();
      
      // Verify navigation occurred (this might need adjustment based on your navigation setup)
      expect(find.byType(OtpVerificationPage), findsOneWidget);
    });

    testWidgets('navigates to login page when login link is tapped', (WidgetTester tester) async {
      // Build the signup page widget
      await tester.pumpWidget(MaterialApp(
        routes: {
          '/': (context) => const SignupPage(),
        },
      ));
      
      // Find and tap the login link
      final loginLink = find.text('Already have an account ?');
      await tester.tap(loginLink);
      await tester.pumpAndSettle();
      
      // Verify navigation to login page
      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
