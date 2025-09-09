import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/guest_login_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/login_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/view_models/login_cubit.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/view_models/login_event.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/view_models/login_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/login_fixtures.dart';
import 'login_cubit_test.mocks.dart';

@GenerateMocks([LoginUseCase, GuestLoginUseCase])
void main() {
  group("Login Cubit test", () {
    late MockLoginUseCase mockLoginUseCase;
    late LoginRequestModel loginRequestModel;
    late MockGuestLoginUseCase mockGuestLoginUseCase;
    late LoginEntity loginEntity;
    late LoginState state;
    late ApiErrorResult<LoginEntity> expectedError;
    late ApiSuccessResult<LoginEntity> expectedResult;

    setUp(() {
      mockLoginUseCase = MockLoginUseCase();
      mockGuestLoginUseCase = MockGuestLoginUseCase();
      loginEntity = LoginTestFixtures.fakeLoginEntity();
      loginRequestModel = LoginTestFixtures.fakeLoginRequest();
      state = const LoginState();
      expectedError = ApiErrorResult<LoginEntity>("Server Error");
      expectedResult = ApiSuccessResult<LoginEntity>(loginEntity);
    });
    provideDummy<ApiResult<LoginEntity>>(
      ApiErrorResult<LoginEntity>("Server Error"),
    );

    blocTest<LoginCubit, LoginState>(
      'emits [loading, success] when login succeeds',
      build: () {
        return LoginCubit(mockLoginUseCase, mockGuestLoginUseCase);
      },
      act: (cubit) async {
        when(
          mockLoginUseCase.call(requestModel: loginRequestModel),
        ).thenAnswer((_) async => expectedResult);

        await cubit.doIntent(
          LoginEventRequest(
            email: loginRequestModel.email,
            password: loginRequestModel.password,
          ),
        );
      },
      expect: () => [
        state.copyWith(loading: true),
        state.copyWith(loading: false, loginEntity: loginEntity),
      ],
      verify: (_) {
        verify(
          mockLoginUseCase.call(requestModel: loginRequestModel),
        ).called(1);
      },
    );
    blocTest<LoginCubit, LoginState>(
      'emits [loading, error] when login fails',
      build: () {
        return LoginCubit(mockLoginUseCase, mockGuestLoginUseCase);
      },
      act: (cubit) async {
        when(
          mockLoginUseCase.call(requestModel: loginRequestModel),
        ).thenAnswer((_) async => expectedError);

        cubit.doIntent(
          LoginEventRequest(
            email: loginRequestModel.email,
            password: loginRequestModel.password,
          ),
        );
      },
      expect: () => [
        state.copyWith(loading: true),
        state.copyWith(loading: false, errorMessage: "Server Error"),
      ],
      verify: (_) {
        verify(
          mockLoginUseCase.call(requestModel: anyNamed('requestModel')),
        ).called(1);
      },
    );
    blocTest<LoginCubit, LoginState>(
      'emits [initial] and updates rememberMe when remember me toggled',
      build: () => LoginCubit(mockLoginUseCase, mockGuestLoginUseCase),
      act: (cubit) {
        cubit.doIntent(LoginEventRememberMe(rememberMe: true));
      },
      expect: () => [state.initial()],
      verify: (cubit) {
        expect(cubit.rememberMe, true);
      },
    );
  });
}
