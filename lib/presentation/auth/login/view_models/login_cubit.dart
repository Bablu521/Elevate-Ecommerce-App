import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/login_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/view_models/login_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/view_models/login_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginState());
  final LoginUseCase _loginUseCase;
  bool rememberMe = false;
  void doIntent(LoginEvent event) {
    switch (event) {
      case LoginEventRequest():
        _login(email: event.email, password: event.password);
      case LoginEventContinueAsGuest():
        // TODO: Handle this case.
        throw UnimplementedError();
      case LoginEventRememberMe():
        rememberMe = event.rememberMe;
        _rememberMeRebuild(rememberMe);
    }
  }

  void _rememberMeRebuild(bool isRememberMe) {
    rememberMe = isRememberMe;
    emit(LoginState.initial());
  }

  Future<void> _login({required String email, required String password}) async {
    emit(state.copyWith(loading: true));
    final response = await _loginUseCase.call(
      requestModel: LoginRequestModel(
        email: email,
        password: password,
        rememberMe: rememberMe,
      ),
    );
    switch (response) {
      case ApiSuccessResult<LoginEntity>():
        emit(state.copyWith(loading: false, loginEntity: response.data));
      case ApiErrorResult<LoginEntity>():
        emit(
          state.copyWith(loading: false, errorMessage: response.errorMessage),
        );
    }
  }
}
