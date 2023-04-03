abstract class LoginRegisterEvent {}

class LoginRegisterUsernameChanged extends LoginRegisterEvent{
  final String username;

  LoginRegisterUsernameChanged({required this.username});
}


class LoginRegisterPasswordChanged extends LoginRegisterEvent{
  final String password;

  LoginRegisterPasswordChanged({required this.password});
}

class LoginRegisterEmailChanged extends LoginRegisterEvent {
  final String email;

  LoginRegisterEmailChanged({required this.email});
}

class LoginSubmitted extends LoginRegisterEvent {
  final Future<void>? Function() onSuccess;

  LoginSubmitted({required this.onSuccess});
}

class RegisterSubmitted extends LoginRegisterEvent {
  final Future<void>? Function() onSuccess;

  RegisterSubmitted({required this.onSuccess});
}


class LogoutRequested extends LoginRegisterEvent{}