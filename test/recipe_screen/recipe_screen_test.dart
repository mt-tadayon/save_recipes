import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Great Function: ', () {
    test('should do something important', () {
      expect(true, isTrue, reason: "This methos was not a great function.");
    });

    test("should do something more important", () {
      expect(true, isTrue, reason: "This methos was not a great function");
    });

    test("should impress the customer", () {
      expect(true, isTrue, reason: "It really should impress the customer");
    });

    test("should impress the customer", () {
      expect(true, isTrue, reason: "It really should impress the customer");
    });
  });
}
