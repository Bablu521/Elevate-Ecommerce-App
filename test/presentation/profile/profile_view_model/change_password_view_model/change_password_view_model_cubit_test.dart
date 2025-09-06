import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/change_password_request/change_password_request.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/change_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/change_password_profile_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/change_password_view_model/change_password_view_model_cubit.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/change_password_view_model/change_password_view_model_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/profile_fixtures.dart';
import 'change_password_view_model_cubit_test.mocks.dart';

@GenerateMocks([ChangePasswordProfileUseCase])
void main() {
  group("test change password cubit", () {
    late ChangePasswordViewModelCubit changePasswordViewModelCubit;
    late ChangePasswordViewModelState state;
    late MockChangePasswordProfileUseCase fakeUseCase;
    final ChangePasswordRequest fakeRequest =
        ProfileFixtures.fakeChangePasswordRequest;
    final ChangePasswordEntity changePasswordEntity =
        const ChangePasswordEntity(
          token: "fake_token",
          message: "fake_message",
        );
    final DioException dioException = DioException(
      requestOptions: RequestOptions(),
      message: "fake_dio_error",
    );
    setUp(() {
      fakeUseCase = MockChangePasswordProfileUseCase();
      changePasswordViewModelCubit = ChangePasswordViewModelCubit(fakeUseCase);
      state = ChangePasswordViewModelState();
      provideDummy<ApiResult<ChangePasswordEntity>>(
        ApiSuccessResult<ChangePasswordEntity>(changePasswordEntity),
      );
      provideDummy<ApiResult<ChangePasswordEntity>>(
        ApiErrorResult<ChangePasswordEntity>(dioException),
      );
    });
    blocTest(
      "test emit loading and success",
      build: () => changePasswordViewModelCubit,
      act: (bloc) {
        when(fakeUseCase.call(fakeRequest)).thenAnswer(
          (_) async =>
              ApiSuccessResult<ChangePasswordEntity>(changePasswordEntity),
        );
        bloc.doIntent(ChangePasswordEvent(changePasswordRequest: fakeRequest));
      },
      expect: () => [
        state.copyWith(isLoading: true),
        state.copyWith(changePasswordEntity: changePasswordEntity),
      ],
      verify: (bloc) {
        verify(fakeUseCase.call(fakeRequest)).called(1);
      },
    );
    blocTest(
      "test emit loading and failure",
      build: () => changePasswordViewModelCubit,
      act: (bloc) {
        when(fakeUseCase.call(fakeRequest)).thenAnswer(
          (_) async => ApiErrorResult<ChangePasswordEntity>(dioException),
        );
        bloc.doIntent(ChangePasswordEvent(changePasswordRequest: fakeRequest));
      },
      expect: () => [
        state.copyWith(isLoading: true),
        state.copyWith(errorMessage: "An unexpected error occurred: fake_dio_error"),
      ],
      verify: (bloc) {
        verify(fakeUseCase.call(fakeRequest)).called(1);
      },
    );
  });
}
