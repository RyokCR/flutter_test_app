import 'package:equatable/equatable.dart';
import 'package:flutter_test_app/auth/login_register/form_submission_status.dart';

import '../../model/entities/user.dart';

class LoginRegisterState extends Equatable{

  final User user;
  bool get isValidUsername => user.username.length > 3;

  bool get isValidPassword => user.password.length > 6;

  bool get isValidEmail => user.email.length > 3;

  final FormSubmissionStatus formStatus;

  LoginRegisterState({required this.user,
    this.formStatus = const InitialFormStatus()});

  LoginRegisterState copyWith({
     String? username,
     String? password,
     String? email,
     FormSubmissionStatus? formStatus
  }){
    this.user.username = username ?? this.user.username;
        this.user.password = password ?? this.user.password;
        this.user.email = email ?? this.user.email;
    return LoginRegisterState(
        user: this.user,
        formStatus: formStatus ?? this.formStatus
    );
  }


  @override
  // TODO: implement props
  List<Object?> get props => [user.username, user.password, user.email];


}