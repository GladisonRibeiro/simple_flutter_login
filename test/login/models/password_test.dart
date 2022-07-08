import 'package:flutter_test/flutter_test.dart';
import 'package:simple_flutter_login/login/login.dart';

void main() {
  group('Password', () {
    const passwordString = 'password';

    test('deve criar uma instância pura', () {
      const password = Password.pure();
      expect(password.value, '');
      expect(password.pure, true);
    });

    test('deve criar uma instância suja', () {
      const password = Password.dirty(passwordString);
      expect(password.value, passwordString);
      expect(password.pure, false);
    });

    test(
        'deve retornar PasswordValidationError.empty caso o password estiver vazio',
        () {
      expect(
        const Password.dirty('').error,
        PasswordValidationError.empty,
      );
    });
  });
}
