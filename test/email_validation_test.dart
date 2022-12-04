import 'package:flutter_test/flutter_test.dart';

import 'package:jwt/core/validator.dart';

void main() {
  group('invalid email cases', () {
    test('is email empty', () {
      final result = Validate.email('');
      expect(result, 'Email looks invalid');
    });

    test('is email invalid', () {
      final result = Validate.email('test@.com');
      expect(result, 'Email looks invalid');
    });

    test('is email invalid when start with white space', () {
      final result = Validate.email(' test@email.com');
      expect(result, 'Email looks invalid');
    });

    test('is email invalid when end with white space', () {
      final result = Validate.email('test@email.com ');
      expect(result, 'Email looks invalid');
    });
  });

  group('valid email cases', () {
    test('is email valid', () {
      final result = Validate.email('test@test.com');
      expect(result, null);
    });
  });
}
