import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';

class LoginState {
  final String? errorMessage;
  final LoginEntity? loginEntity;
  final bool loading;

  LoginState({this.errorMessage, this.loginEntity, this.loading = false});
  factory LoginState.initial() => LoginState();
  factory LoginState.copyWith({
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
