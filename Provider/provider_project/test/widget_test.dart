import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_project/checkout.dart';
import 'package:provider_project/main.dart';

void main() {
  testWidgets('Adds items to cart and updates the badge', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('S24 ultra'), findsOneWidget);
    expect(find.text('\$300.00'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add_circle_outline).first);
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('CheckOut shows empty state and sticky total', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.add_circle_outline).first);
    await tester.pump();

    await tester.tap(find.byIcon(Icons.add_shopping_cart));
    await tester.pumpAndSettle();

    expect(find.text('CheckOut'), findsOneWidget);
    expect(find.text('S24 ultra'), findsOneWidget);
    expect(find.text('\$300.00'), findsWidgets);
    expect(find.textContaining('Total (1 items)'), findsOneWidget);
  });
}
