import 'package:flutter_test/flutter_test.dart';
import 'package:target_project/app/core/shared/validators/email_validator.dart';

void main() {
  group('EmailValidator | Success |', () {
    test(
      'should be valid when length is >2 and <=20',
      () {
        final message = emailValidator('Whatever123');
        expect(message, isNull);
      },
    );
  });
  group('EmailValidator | Failure |', () {
    test('should be invalid when is empty', () {
      final message = emailValidator('');
      expect(message, isA<String>());
    });

    test('should be invalid when is null', () {
      final message = emailValidator(null);
      expect(message, isA<String>());
    });

    test('should be invalid when length is lower than 2', () {
      final message = emailValidator('a');
      expect(message, isA<String>());
    });

    test('should be invalid when length is greater than 20', () {
      final message = emailValidator('012345678901234567890');
      expect(message, isA<String>());
    });
  });
}
