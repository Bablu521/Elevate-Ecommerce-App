import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/forget_password_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/reset_password_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/verify_reset_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/forget_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/reset_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/verify_reset_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/forget_password_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/reset_password_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/verify_reset_code_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/auth/forget_password/view_models/forget_password_events.dart';
import 'package:elevate_ecommerce_app/presentation/auth/forget_password/view_models/forget_password_state.dart';
import 'package:elevate_ecommerce_app/presentation/auth/forget_password/view_models/forget_password_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forget_password_view_model_test.mocks.dart';

@GenerateMocks([
  ForgetPasswordUseCase,
  VerifyResetCodeUseCase,
  ResetPasswordUseCase,
])
void main() {
  group("test ForgetPasswordViewModel", () {
    late MockForgetPasswordUseCase mockForgetPasswordUseCase;
    late MockVerifyResetCodeUseCase mockVerifyResetCodeUseCase;
    late MockResetPasswordUseCase mockResetPasswordUseCase;
    late ForgetPasswordViewModel forgetPasswordViewModel;
    late ForgetPasswordState state;

    setUp(() {
      mockForgetPasswordUseCase = MockForgetPasswordUseCase();
      mockVerifyResetCodeUseCase = MockVerifyResetCodeUseCase();
      mockResetPasswordUseCase = MockResetPasswordUseCase();
      forgetPasswordViewModel = ForgetPasswordViewModel(
        mockForgetPasswordUseCase,
        mockVerifyResetCodeUseCase,
        mockResetPasswordUseCase,
      );
      state = ForgetPasswordState();
    });

    group("test ForgetPasswordUseCase", () {
      late ForgetPasswordRequestEntity forgetPasswordRequestEntity;

      setUp(() {
        forgetPasswordRequestEntity = const ForgetPasswordRequestEntity(
          email: "fake-email",
        );
      });

      final expectedEntity = ForgetPasswordEntity(
        message: "fake-message",
        info: "fake-info",
      );

      final expectedResult = ApiSuccessResult<ForgetPasswordEntity>(
        expectedEntity,
      );
      provideDummy<ApiResult<ForgetPasswordEntity>>(expectedResult);

      blocTest<ForgetPasswordViewModel, ForgetPasswordState>(
        'call doIntent with ForgetPasswordEvent then load and succeeded',
        build: () => forgetPasswordViewModel,
        act: (bloc) {
          when(
            mockForgetPasswordUseCase(forgetPasswordRequestEntity),
          ).thenAnswer((_) async => expectedResult);
          bloc.emailController.text = "fake-email";
          return bloc.doIntent(ForgetPasswordEvent());
        },
        expect: () => <ForgetPasswordState>[
          state.copyWith(isLoading: true),
          state.copyWith(
            isLoading: false,
            forgetPasswordResponse: expectedEntity,
            pageNumber: 1,
          ),
        ],
        verify: (_) {
          verify(
            mockForgetPasswordUseCase(forgetPasswordRequestEntity),
          ).called(1);
        },
      );

      final errorMessage = "Server Error";
      final expectedError = ApiErrorResult<ForgetPasswordEntity>(errorMessage);
      provideDummy<ApiResult<ForgetPasswordEntity>>(expectedError);

      blocTest<ForgetPasswordViewModel, ForgetPasswordState>(
        "call doIntent with ForgetPasswordEvent then load and failed",
        build: () => forgetPasswordViewModel,
        act: (bloc) async {
          when(
            mockForgetPasswordUseCase(forgetPasswordRequestEntity),
          ).thenAnswer((_) async => expectedError);
          bloc.emailController.text = "fake-email";
          return bloc.doIntent(ForgetPasswordEvent());
        },
        expect: () => [
          state.copyWith(isLoading: true),
          state.copyWith(isLoading: false, errorMessage: errorMessage),
        ],
        verify: (_) {
          verify(
            mockForgetPasswordUseCase(forgetPasswordRequestEntity),
          ).called(1);
        },
      );
    });

    group("test VerifyResetCodeUseCase", () {
      late VerifyResetRequestEntity verifyResetRequestEntity;

      setUp(() {
        verifyResetRequestEntity = const VerifyResetRequestEntity(
          resetCode: "fake-reset-code",
        );
      });

      final expectedEntity = VerifyResetEntity(status: "fake-status");

      final expectedResult = ApiSuccessResult<VerifyResetEntity>(
        expectedEntity,
      );
      provideDummy<ApiResult<VerifyResetEntity>>(expectedResult);

      blocTest<ForgetPasswordViewModel, ForgetPasswordState>(
        'call doIntent with VerifyResetCodeEvent then load and succeeded',
        build: () => forgetPasswordViewModel,
        act: (bloc) {
          when(
            mockVerifyResetCodeUseCase(verifyResetRequestEntity),
          ).thenAnswer((_) async => expectedResult);
          bloc.resetCodeController.text = "fake-reset-code";
          return bloc.doIntent(VerifyResetCodeEvent());
        },
        expect: () => <ForgetPasswordState>[
          state.copyWith(isLoading: true),
          state.copyWith(
            isLoading: false,
            verifyResetResponse: expectedEntity,
            pageNumber: 2,
          ),
        ],
        verify: (_) {
          verify(
            mockVerifyResetCodeUseCase(verifyResetRequestEntity),
          ).called(1);
        },
      );

      final errorMessage = "Server Error";
      final expectedError = ApiErrorResult<VerifyResetEntity>(errorMessage);
      provideDummy<ApiResult<VerifyResetEntity>>(expectedError);

      blocTest<ForgetPasswordViewModel, ForgetPasswordState>(
        "call doIntent with VerifyResetCodeEvent then load and failed",
        build: () => forgetPasswordViewModel,
        act: (bloc) async {
          when(
            mockVerifyResetCodeUseCase(verifyResetRequestEntity),
          ).thenAnswer((_) async => expectedError);
          bloc.resetCodeController.text = "fake-reset-code";
          return bloc.doIntent(VerifyResetCodeEvent());
        },
        expect: () => [
          state.copyWith(isLoading: true),
          state.copyWith(isLoading: false, validateResetCode: true),
        ],
        verify: (_) {
          verify(
            mockVerifyResetCodeUseCase(verifyResetRequestEntity),
          ).called(1);
        },
      );
    });

    group("test ResetPasswordUseCase", () {
      late ResetPasswordRequestEntity resetPasswordRequestEntity;

      setUp(() {
        resetPasswordRequestEntity = const ResetPasswordRequestEntity(
          email: "fake-email",
          newPassword: "fake-new-password",
        );
      });

      final expectedEntity = ResetPasswordEntity(message: "fake-message");

      final expectedResult = ApiSuccessResult<ResetPasswordEntity>(
        expectedEntity,
      );
      provideDummy<ApiResult<ResetPasswordEntity>>(expectedResult);

      blocTest<ForgetPasswordViewModel, ForgetPasswordState>(
        'call doIntent with ResetPasswordEvent then load and succeeded',
        build: () => forgetPasswordViewModel,
        act: (bloc) {
          when(
            mockResetPasswordUseCase(resetPasswordRequestEntity),
          ).thenAnswer((_) async => expectedResult);
          bloc.emailController.text = "fake-email";
          bloc.newPasswordController.text = "fake-new-password";
          return bloc.doIntent(ResetPasswordEvent());
        },
        expect: () => <ForgetPasswordState>[
          state.copyWith(isLoading: true),
          state.copyWith(
            isLoading: false,
            resetPasswordResponse: expectedEntity,
            isSuccess: true,
          ),
        ],
        verify: (_) {
          verify(
            mockResetPasswordUseCase(resetPasswordRequestEntity),
          ).called(1);
        },
      );

      final errorMessage = "Server Error";
      final expectedError = ApiErrorResult<ResetPasswordEntity>(errorMessage);
      provideDummy<ApiResult<ResetPasswordEntity>>(expectedError);

      blocTest<ForgetPasswordViewModel, ForgetPasswordState>(
        "call doIntent with ResetPasswordEvent then load and failed",
        build: () => forgetPasswordViewModel,
        act: (bloc) async {
          when(
            mockResetPasswordUseCase(resetPasswordRequestEntity),
          ).thenAnswer((_) async => expectedError);
          bloc.emailController.text = "fake-email";
          bloc.newPasswordController.text = "fake-new-password";
          return bloc.doIntent(ResetPasswordEvent());
        },
        expect: () => [
          state.copyWith(isLoading: true),
          state.copyWith(isLoading: false, errorMessage: errorMessage),
        ],
        verify: (_) {
          verify(
            mockResetPasswordUseCase(resetPasswordRequestEntity),
          ).called(1);
        },
      );
    });
  });
}
