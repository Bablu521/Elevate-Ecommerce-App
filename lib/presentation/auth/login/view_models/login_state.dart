import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';

class LoginState {
  final String? errorMessage;
  final LoginEntity? loginEntity;
  final bool loading;

  const LoginState({this.errorMessage, this.loginEntity, this.loading = false});

  factory LoginState.initial() => const LoginState();

  LoginState copyWith({
    String? errorMessage,
    LoginEntity? loginEntity,
    bool? loading,
  }) {
    return LoginState(
      errorMessage: errorMessage ?? this.errorMessage,
      loginEntity: loginEntity ?? this.loginEntity,
      loading: loading ?? this.loading,
    );
  }
}
