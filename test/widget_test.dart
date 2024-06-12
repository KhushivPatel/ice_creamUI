import 'package:flutter/material.dart';
import 'package:flutter_task3/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Calculator test", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byWidget(const Text("0")), findsOneWidget);
  });
}
