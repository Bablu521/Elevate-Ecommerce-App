import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String? errorMessage;
  final LoginEntity? loginEntity;
  final bool loading;
  final bool rememberMe;

  const LoginState({
    this.errorMessage,
    this.loginEntity,
    this.loading = false,
    this.rememberMe = false,
  });

  LoginState copyWith({
    String? errorMessage,
    LoginEntity? loginEntity,
    bool? loading,
    bool? rememberMe,
  }) {
    return LoginState(
      errorMessage: errorMessage ?? this.errorMessage,
      loginEntity: loginEntity ?? this.loginEntity,
      loading: loading ?? this.loading,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  List<Object?> get props => [errorMessage, loginEntity, loading, rememberMe];
}
