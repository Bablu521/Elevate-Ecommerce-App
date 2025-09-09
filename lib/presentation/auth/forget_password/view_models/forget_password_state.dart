import 'package:equatable/equatable.dart';

import '../../../../domin/entities/auth/response/forget_password_entity.dart';
import '../../../../domin/entities/auth/response/reset_password_entity.dart';
import '../../../../domin/entities/auth/response/verify_reset_entity.dart';

class ForgetPasswordState extends Equatable {
  bool isLoading;
  ForgetPasswordEntity? forgetPasswordResponse;
  VerifyResetEntity? verifyResetResponse;
  ResetPasswordEntity? resetPasswordResponse;
  String? errorMessage;
  int pageNumber;
  bool isSuccess;
  bool validateResetCode;

  ForgetPasswordState({
    this.isLoading = false,
    this.forgetPasswordResponse,
    this.verifyResetResponse,
    this.resetPasswordResponse,
    this.errorMessage,
    this.pageNumber = 0,
    this.isSuccess = false,
    this.validateResetCode = false,
  });

  ForgetPasswordState copyWith({
    bool? isLoading,
    ForgetPasswordEntity? forgetPasswordResponse,
    VerifyResetEntity? verifyResetResponse,
    ResetPasswordEntity? resetPasswordResponse,
    String? errorMessage,
    int? pageNumber,
    bool? isSuccess,
    bool? validateResetCode,
  }) {
    return ForgetPasswordState(
      isLoading: isLoading ?? this.isLoading,
      forgetPasswordResponse:
          forgetPasswordResponse ?? this.forgetPasswordResponse,
      verifyResetResponse: verifyResetResponse ?? this.verifyResetResponse,
      resetPasswordResponse:
          resetPasswordResponse ?? this.resetPasswordResponse,
      errorMessage: errorMessage,
      pageNumber: pageNumber ?? this.pageNumber,
      isSuccess: isSuccess ?? this.isSuccess,
      validateResetCode: validateResetCode ?? this.validateResetCode,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    forgetPasswordResponse,
    verifyResetResponse,
    resetPasswordResponse,
    errorMessage,
    pageNumber,
    isSuccess,
    validateResetCode,
  ];
}
