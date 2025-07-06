import 'package:assignments/assignment_3/utils/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Email Validator', (){
    test('returns error if email is empty', (){
      expect(validateEmail(''), 'Enter a valid email');
    });

    test('returns error if email does not contain @', (){
      expect(validateEmail('shadab.com'), 'Enter a valid email');
    });

    test('returns null if email is valid', (){
      expect(validateEmail('shadab@gmail.com'), null);
    });

    group('Password Validator', (){
      test('returns error if password is null', (){
        expect(validatePassword(null), 'Password must be atleast 6 characters');
      });

      test('returns error if password is to short', (){
        expect(validatePassword('123'), 'Password must be atleast 6 characters');
      });

      test('returns null if password is valid', (){
        expect(validatePassword('123456'), null);
      });
    });
  });
}
