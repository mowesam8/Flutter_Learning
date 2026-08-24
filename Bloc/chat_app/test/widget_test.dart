import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Center(child: Text('Scholar Chat'))),
      ),
    );

    expect(find.text('Scholar Chat'), findsOneWidget);
  });
}
