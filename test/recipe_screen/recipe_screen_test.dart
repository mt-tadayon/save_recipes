import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saverecipes/recipe_screen/recipe_screen.dart';

void main() {
  testWidgets('RecipeScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: RecipeScreen(
          name: 'name',
          imageFile: File("imageFile.png"),
        ),
      ),
    );

    // Create the Finder
    final nameFinder = find.text('name');
    expect(nameFinder, findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });

  group('Great Function: ', () {
    test('should do something important', () {
      expect(true, isTrue, reason: "This method was a good function.");
    });

    test("should do something more important", () {
      expect(true, isFalse, reason: "This method was a great function");
    });

    test("should impress the customer", () {
      expect(true, isTrue, reason: "It really should impress the customer");
    });

  });
}
