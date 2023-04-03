

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/auth/login_register/form_submission_status.dart';
import 'package:flutter_test_app/auth/login_register/login_register_event.dart';
import 'package:flutter_test_app/auth/login_register/login_register_state.dart';
import 'package:provider/provider.dart';

import '../../model/entities/user.dart';

class LoginRegisterBloc extends Bloc<LoginRegisterEvent, LoginRegisterState> {
  LoginRegisterBloc({required User user}): super(LoginRegisterState(user: user)) {
    on<LoginRegisterUsernameChanged>((event, emit) => emit(state.copyWith(username: event.username)));
    on<LoginRegisterPasswordChanged>((event, emit) => emit(state.copyWith(password: event.password)));
    on<LoginRegisterEmailChanged>((event, emit) => emit(state.copyWith(email: event.email)));
    on<LoginSubmitted>(_onLoginSubmitted);
    on<RegisterSubmitted>(_onRegisterSubmitted);
    on<LogoutRequested>(_onLogoutRequested);


  }

  Future<void> _onLoginSubmitted(LoginSubmitted event, Emitter emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try{
      emit(state.copyWith(formStatus: SubmissionSuccess()));
      bool success = await state.user.signIn(state.user.username, state.user.password);

      if(success) {
        event.onSuccess();
      }
    } catch (e){
      emit(state.copyWith(formStatus: SubmissionFailed(e)));
    }
  }

  Future<void> _onRegisterSubmitted(RegisterSubmitted event, Emitter emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try{
      emit(state.copyWith(formStatus: SubmissionSuccess()));
      await state.user.signUp(state.user.username, state.user.email, state.user.password);

      event.onSuccess();

    } catch (e){
      emit(state.copyWith(formStatus: SubmissionFailed(e)));
    }
  }

  Future<void> _onLogoutRequested(LogoutRequested event, Emitter emit) async {
    state.user.logOut();
    emit(state);

  }



}