import 'package:flutter_test/flutter_test.dart';
import 'package:simple_flutter_login/login/login.dart';

void main() {
  group('Username', () {
    const usernameString = 'username';

    test('deve criar uma instância pura', () {
      const username = Username.pure();
      expect(username.value, '');
      expect(username.pure, true);
    });

    test('deve criar uma instância suja', () {
      const username = Username.dirty(usernameString);
      expect(username.value, usernameString);
      expect(username.pure, false);
    });

    test(
        'deve retornar UsernameValidationError.empty caso o username estiver vazio',
        () {
      expect(
        const Username.dirty('').error,
        UsernameValidationError.empty,
      );
    });
  });
}
