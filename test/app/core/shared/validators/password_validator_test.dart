import 'package:flutter_test/flutter_test.dart';
import 'package:target_project/app/core/shared/validators/password_validator.dart';

void main() {
  group('PasswordValidator | Failure |', () {
    test(
      'should be valid when length is >2 and <=20 and dont had any special character',
      () {
        final message = passwordValidator('Whatever123');
        expect(message, isNull);
      },
    );
  });
  group('PasswordValidator | Failure |', () {
    test('should be invalid when is empty', () {
      final message = passwordValidator('');
      expect(message, isA<String>());
    });

    test('should be invalid when is null', () {
      final message = passwordValidator(null);
      expect(message, isA<String>());
    });

    test('should be invalid when length is lower than 2', () {
      final message = passwordValidator('a');
      expect(message, isA<String>());
    });

    test('should be invalid when length is greater than 20', () {
      final message = passwordValidator('012345678901234567890');
      expect(message, isA<String>());
    });

    test(
        'should be invalid when length is >2 and <20 but had any special character',
        () {
      final message = passwordValidator('0123456@4567890');
      expect(message, isA<String>());
    });
  });
}
