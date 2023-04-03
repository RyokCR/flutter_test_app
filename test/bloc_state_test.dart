
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_app/auth/login_register/form_submission_status.dart';
import 'package:flutter_test_app/auth/login_register/login_register_bloc.dart';
import 'package:flutter_test_app/auth/login_register/login_register_event.dart';
import 'package:flutter_test_app/auth/login_register/login_register_state.dart';
import 'package:flutter_test_app/model/entities/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';



Future<void> main() async {



  group('Login Register Bloc Testing', (){
    late LoginRegisterBloc loginRegisterBloc;

    setUp(() async {
      loginRegisterBloc = LoginRegisterBloc( user: User());

    });

    blocTest<LoginRegisterBloc, LoginRegisterState>(
        'Change Name Test',
        build: () => loginRegisterBloc,
      act: (bloc) => bloc.add(LoginRegisterUsernameChanged(username: 'jhon')),
      expect: () => <LoginRegisterState>[LoginRegisterState(user: User()..username='jhon')],
    );

    blocTest<LoginRegisterBloc, LoginRegisterState>(
      'Change Password Test',
      build: () => loginRegisterBloc,
      act: (bloc) => bloc.add(LoginRegisterPasswordChanged(password: 'password')),
      expect: () => <LoginRegisterState>[LoginRegisterState(user: User()..password='password')],
    );

    blocTest<LoginRegisterBloc, LoginRegisterState>(
      'Change Email Test',
      build: () => loginRegisterBloc,
      act: (bloc) => bloc.add(LoginRegisterEmailChanged(email: 'email')),
      expect: () => <LoginRegisterState>[LoginRegisterState(user: User()..email='email')],
    );

    blocTest<LoginRegisterBloc, LoginRegisterState>(
      'Register Test',
      build: () => loginRegisterBloc,
      act: (bloc) => bloc.add(RegisterSubmitted(onSuccess: () {})),
      expect: () =>[LoginRegisterState(user: User(), formStatus: FormSubmitting())]
    );


    blocTest<LoginRegisterBloc, LoginRegisterState>(
        'Login Test',
        build: () => loginRegisterBloc,
        act: (bloc) => bloc.add(LoginSubmitted(onSuccess: () {})),
        expect: () =>[LoginRegisterState(user: User(), formStatus: FormSubmitting())]
    );


});
}

