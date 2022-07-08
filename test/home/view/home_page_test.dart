import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_flutter_login/authentication/autentication.dart';
import 'package:simple_flutter_login/home/home.dart';
import 'package:simple_flutter_login/widgets/widgets.dart';
import 'package:user_repository/user_repository.dart';

class AuthenticationBlocMock
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

void main() {
  group('HomePage', () {
    const user = User('id');
    late AuthenticationBloc authenticationBloc;

    setUp(() {
      authenticationBloc = AuthenticationBlocMock();
      when(() => authenticationBloc.state)
          .thenReturn(const AuthenticationState.authenticated(user));
    });

    test('deve retornar uma rota ao chamar o metodo route', () {
      expect(HomePage.route(), isA<MaterialPageRoute>());
    });

    testWidgets('deve ter um Headline', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: authenticationBloc,
          child: const MaterialApp(
            home: Scaffold(body: HomePage()),
          ),
        ),
      );
      expect(find.byType(Headline), findsOneWidget);
    });

    testWidgets('deve ter um Button', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: authenticationBloc,
          child: const MaterialApp(
            home: Scaffold(body: HomePage()),
          ),
        ),
      );
      expect(find.byType(Button), findsOneWidget);
    });
  });
}
