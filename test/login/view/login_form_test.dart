import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_flutter_login/login/login.dart';

class LoginBlocMock extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  group('LoginForm', () {
    late LoginBloc loginBloc;

    setUp(() {
      loginBloc = LoginBlocMock();
    });

    testWidgets(
        'deve adiconar o state LoginUsernameChanged ao LoginBloc quando o username for atualizado',
        (tester) async {
      const username = 'username';
      when(() => loginBloc.state).thenReturn(const LoginState());
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider.value(
              value: loginBloc,
              child: const LoginForm(),
            ),
          ),
        ),
      );
      await tester.enterText(
        find.byKey(const Key('login_form_username_input_textField')),
        username,
      );
      verify(
        () => loginBloc.add(const LoginUsernameChanged(username)),
      ).called(1);
    });

    testWidgets(
        'deve adiconar o state LoginPasswordChanged ao LoginBloc quando o password for atualizado',
        (tester) async {
      const password = 'password';
      when(() => loginBloc.state).thenReturn(const LoginState());
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider.value(
              value: loginBloc,
              child: const LoginForm(),
            ),
          ),
        ),
      );
      await tester.enterText(
        find.byKey(const Key('login_form_password_input_textField')),
        password,
      );
      verify(
        () => loginBloc.add(const LoginPasswordChanged(password)),
      ).called(1);
    });

    testWidgets('deve começar com o botão Login desabilitado', (tester) async {
      when(() => loginBloc.state).thenReturn(const LoginState());
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider.value(
              value: loginBloc,
              child: const LoginForm(),
            ),
          ),
        ),
      );
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.enabled, isFalse);
    });

    testWidgets(
        'deve exibir o indicador de carregamento quando o state do formulário for FormzStatus.submissionInProgress',
        (tester) async {
      when(() => loginBloc.state).thenReturn(
        const LoginState(status: FormzStatus.submissionInProgress),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider.value(
              value: loginBloc,
              child: const LoginForm(),
            ),
          ),
        ),
      );
      expect(find.byType(ElevatedButton), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'deve estar habilitado o botão quando o state do formulário for FormzStatus.valid',
        (tester) async {
      when(() => loginBloc.state).thenReturn(
        const LoginState(status: FormzStatus.valid),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider.value(
              value: loginBloc,
              child: const LoginForm(),
            ),
          ),
        ),
      );
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.enabled, isTrue);
    });

    testWidgets(
        'deve adicionar o state LoginSubmitted ao LoginBloc quando o botão for pressionado',
        (tester) async {
      when(() => loginBloc.state).thenReturn(
        const LoginState(status: FormzStatus.valid),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider.value(
              value: loginBloc,
              child: const LoginForm(),
            ),
          ),
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      verify(() => loginBloc.add(const LoginSubmitted())).called(1);
    });

    testWidgets('deve exibir a SnackBar quando o status do envio fallhar',
        (tester) async {
      whenListen(
        loginBloc,
        Stream.fromIterable([
          const LoginState(status: FormzStatus.submissionInProgress),
          const LoginState(status: FormzStatus.submissionFailure),
        ]),
      );
      when(() => loginBloc.state).thenReturn(
        const LoginState(status: FormzStatus.submissionFailure),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider.value(
              value: loginBloc,
              child: const LoginForm(),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
