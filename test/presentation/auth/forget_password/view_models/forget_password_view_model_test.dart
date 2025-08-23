import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/forget_password_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/forget_password_entity.dart';
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
        forgetPasswordRequestEntity = ForgetPasswordRequestEntity(
          email: "fake-email",
        );
      });

      var expectedEntity = ForgetPasswordEntity(
        message: "fake-message",
        info: "fake-info",
      );

      var expectedResult = ApiSuccessResult<ForgetPasswordEntity>(
        expectedEntity,
      );
      provideDummy<ApiResult<ForgetPasswordEntity>>(expectedResult);

      blocTest<ForgetPasswordViewModel, ForgetPasswordState>(
        'call doIntent with ForgetPasswordEvent then load and succeeded',
        build: () => forgetPasswordViewModel,
        act: (forgetPasswordViewModel) {
          when(
            mockForgetPasswordUseCase(forgetPasswordRequestEntity),
          ).thenAnswer((_) async => expectedResult);
          forgetPasswordViewModel.emailController.text = "fake-email";
          return forgetPasswordViewModel.doIntent(
            ForgetPasswordEvent(isResend: true),
          );
        },
        expect:
            () => <ForgetPasswordState>[
              state.copyWith(isLoading: true),
              state.copyWith(
                isLoading: false,
                forgetPasswordResponse: expectedEntity,
                pageNumber: 1,
                errorMessage: null,
              ),
            ],
        verify: (_) {
          verify(
            mockForgetPasswordUseCase(forgetPasswordRequestEntity),
          ).called(1);
        },
      );

      var errorMessage = "Server Error";
      var expectedError = ApiErrorResult<ForgetPasswordEntity>(errorMessage);
      provideDummy<ApiResult<ForgetPasswordEntity>>(expectedError);

      blocTest<ForgetPasswordViewModel, ForgetPasswordState>(
        "call doIntent with ForgetPasswordEvent then load and failed",
        build: () => forgetPasswordViewModel,
        act: (forgetPasswordViewModel) async {
          when(
            mockForgetPasswordUseCase(forgetPasswordRequestEntity),
          ).thenAnswer((_) async => expectedError);
          forgetPasswordViewModel.emailController.text = "fake-email";
          return forgetPasswordViewModel.doIntent(
            ForgetPasswordEvent(isResend: true),
          );
        },
        expect:
            () => [
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
  });
}
