import 'package:flutter/material.dart';
import 'package:assignments/assignment_3/login_form.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets('show success snackbar on valid input', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginForm()));

    await tester.enterText(find.byType(TextFormField).at(0), 'shadab@gmail.com');
    await tester.enterText(find.byType(TextFormField).at(1), '123456');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Login Successfull'), findsOneWidget);
  });

  testWidgets('shows email validation error when email is invalid', (WidgetTester tester) async{
    await tester.pumpWidget(const MaterialApp(home: LoginForm()));

    await tester.enterText(find.byType(TextFormField).at(0), 'invalid email');
    await tester.enterText(find.byType(TextFormField).at(1), '123456');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Enter a valid email'), findsOneWidget);
  });

  testWidgets('shows password validation error when password is to short', (WidgetTester tester) async{
    await tester.pumpWidget(const MaterialApp(home: LoginForm()));

    await tester.enterText(find.byType(TextFormField).at(0), 'shadab@gmail.com');
    await tester.enterText(find.byType(TextFormField).at(1), '123');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Password must be atleast 6 characters'), findsOneWidget);
  });
}