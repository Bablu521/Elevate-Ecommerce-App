sealed class LoginEvent {}

class LoginEventRequest extends LoginEvent {
  final String email;
  final String password;

  LoginEventRequest({required this.email, required this.password});
}

class LoginEventContinueAsGuest extends LoginEvent {}

class LoginEventRememberMe extends LoginEvent {
  final bool rememberMe;
  LoginEventRememberMe({required this.rememberMe});
}
