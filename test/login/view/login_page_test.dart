import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_flutter_login/login/view/view.dart';
import 'package:simple_flutter_login/widgets/widgets.dart';

class AuthenticationRepositoryMock extends Mock
    implements AuthenticationRepository {}

void main() {
  group('LoginPage', () {
    late AuthenticationRepository authenticationRepository;

    setUp(() {
      authenticationRepository = AuthenticationRepositoryMock();
    });

    test('deve retornar uma rota ao chamar o metodo route', () {
      expect(LoginPage.route(), isA<MaterialPageRoute>());
    });

    testWidgets('deve ter um Headline', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: authenticationRepository,
          child: const MaterialApp(
            home: Scaffold(body: LoginPage()),
          ),
        ),
      );
      expect(find.byType(Headline), findsOneWidget);
    });

    testWidgets('deve ter um LoginForm', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: authenticationRepository,
          child: const MaterialApp(
            home: Scaffold(body: LoginPage()),
          ),
        ),
      );
      expect(find.byType(LoginForm), findsOneWidget);
    });
  });
}
