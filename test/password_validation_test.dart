import 'package:flutter_test/flutter_test.dart';

import 'package:jwt/core/validator.dart';

void main() {
  group('invalid email cases', () {
    test('should be not empty', () {
      final result = Validate.password('');
      expect(
        result,
        'Password must be at least 6 and maximum of 15 characters',
      );
    });

    test('should be not less than 6 characters', () {
      final result = Validate.password('12345');
      expect(
        result,
        'Password must be at least 6 and maximum of 15 characters',
      );
    });

    test('should be not more than 15 characters', () {
      final result = Validate.password('moreThanFifteenCharsInThePassword');
      expect(
        result,
        'Password must be at least 6 and maximum of 15 characters',
      );
    });

    test('should not accepting white spaces', () {
      final result = Validate.password(' 123 123');
      expect(
        result,
        'Password must be at least 6 and maximum of 15 characters',
      );
    });
  });

  group('valid password cases', () {
    test('should be valid', () {
      final result = Validate.password('Pss123WWW');
      expect(result, null);
    });

    test('should be accepting special characters', () {
      final result = Validate.password('de@43%27');
      expect(result, null);
    });
  });
}
