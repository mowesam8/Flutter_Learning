import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:practice_on_firebase_1/Custom/Custom_Button.dart';

void main() {
  testWidgets('CustomButton renders its title', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomButton(title: 'Login', onPressed: null),
        ),
      ),
    );

    expect(find.text('Login'), findsOneWidget);
  });
}
