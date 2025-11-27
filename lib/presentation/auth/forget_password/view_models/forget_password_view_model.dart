import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/forget_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/reset_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/verify_reset_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/verify_reset_code_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domin/entities/auth/request/forget_password_request_entity.dart';
import '../../../../domin/entities/auth/request/reset_password_request_entity.dart';
import '../../../../domin/entities/auth/request/verify_reset_request_entity.dart';
import '../../../../domin/use_cases/forget_password_use_case.dart';
import '../../../../domin/use_cases/reset_password_use_case.dart';
import 'forget_password_events.dart';
import 'forget_password_state.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  ForgetPasswordViewModel(
    this._forgetPasswordUseCase,
    this._verifyResetCodeUseCase,
    this._resetPasswordUseCase,
  ) : super(ForgetPasswordState());

  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> verifyResetCodeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController resetCodeController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void doIntent(ForgetPasswordEvents events) {
    switch (events) {
      case ForgetPasswordEvent():
        _forgetPassword();
      case VerifyResetCodeEvent():
        _verifyResetCode();
      case ResetPasswordEvent():
        _resetPassword();
    }
  }

  Future<void> _forgetPassword() async {
    emit(state.copyWith(isLoading: true));
    final result = await _forgetPasswordUseCase(
      ForgetPasswordRequestEntity(email: emailController.text),
    );
    switch (result) {
      case ApiSuccessResult<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            isLoading: false,
            forgetPasswordResponse: result.data,
            pageNumber: 1,
          ),
        );
      case ApiErrorResult<ForgetPasswordEntity>():
        emit(
          state.copyWith(isLoading: false, errorMessage: result.errorMessage),
        );
    }
  }

  Future<void> _verifyResetCode() async {
    emit(state.copyWith(isLoading: true));
    final result = await _verifyResetCodeUseCase(
      VerifyResetRequestEntity(resetCode: resetCodeController.text),
    );
    switch (result) {
      case ApiSuccessResult<VerifyResetEntity>():
        emit(
          state.copyWith(
            isLoading: false,
            verifyResetResponse: result.data,
            pageNumber: 2,
          ),
        );
      case ApiErrorResult<VerifyResetEntity>():
        emit(state.copyWith(isLoading: false, validateResetCode: true));
    }
  }

  Future<void> _resetPassword() async {
    emit(state.copyWith(isLoading: true));
    final result = await _resetPasswordUseCase(
      ResetPasswordRequestEntity(
        email: emailController.text,
        newPassword: newPasswordController.text,
      ),
    );
    switch (result) {
      case ApiSuccessResult<ResetPasswordEntity>():
        emit(
          state.copyWith(
            isLoading: false,
            resetPasswordResponse: result.data,
            isSuccess: true,
          ),
        );
      case ApiErrorResult<ResetPasswordEntity>():
        emit(
          state.copyWith(isLoading: false, errorMessage: result.errorMessage),
        );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
