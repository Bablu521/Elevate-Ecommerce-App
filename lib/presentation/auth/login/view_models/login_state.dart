import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';

class LoginState {
  final String? errorMessage;
  final LoginEntity? loginEntity;
  final bool loading;

  const LoginState({this.errorMessage, this.loginEntity, this.loading = false});

  LoginState initial() => LoginState();

  LoginState copyWith({
    String? errorMessage,
    LoginEntity? loginEntity,
    bool? loading,
  }) {
    return LoginState(
      errorMessage: errorMessage ?? "",
      loginEntity: loginEntity,
      loading: loading ?? false,
    );
  }
}
