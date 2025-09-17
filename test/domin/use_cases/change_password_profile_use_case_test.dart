import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/change_password_request/change_password_request.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/repositories/auth_repo_impl.dart';
import 'package:elevate_ecommerce_app/domin/entities/change_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/change_password_profile_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/profile_fixtures.dart';
import 'get_user_status_use_case_test.mocks.dart';

@GenerateMocks([AuthRepoImpl])
void main() {
  late MockAuthRepoImpl mockAuthRepoImpl;
  late ChangePasswordProfileUseCase changePasswordProfileUseCase;
  final ChangePasswordEntity changePasswordEntity = const ChangePasswordEntity(
    token: "fake_token",
    message: "fake_message",
  );
  final ChangePasswordRequest changePasswordRequest =
      ProfileFixtures.fakeChangePasswordRequest;
  final DioException dioException = DioException(
    requestOptions: RequestOptions(),
    message: "fake_dio_error",
  );
  setUp(() {
    mockAuthRepoImpl = MockAuthRepoImpl();
    changePasswordProfileUseCase = ChangePasswordProfileUseCase(
      mockAuthRepoImpl,
    );
    provideDummy<ApiResult<ChangePasswordEntity>>(
      ApiSuccessResult<ChangePasswordEntity>(changePasswordEntity),
    );
    provideDummy<ApiResult<ChangePasswordEntity>>(
      ApiErrorResult<ChangePasswordEntity>(dioException),
    );
  });
  group("change password use case", () {
    test("test success", () async {
      //Arrange
      final expectResult = ApiSuccessResult<ChangePasswordEntity>(
        changePasswordEntity,
      );
      when(
        mockAuthRepoImpl.changePassword(request: changePasswordRequest),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await changePasswordProfileUseCase.call(
        changePasswordRequest,
      );
      //Assert
      expect(result, isA<ApiSuccessResult<ChangePasswordEntity>>());
      expect(
        (result as ApiSuccessResult<ChangePasswordEntity>).data.token,
        equals(changePasswordEntity.token),
      );
      verify(
        mockAuthRepoImpl.changePassword(request: changePasswordRequest),
      ).called(1);
    });
    test("test error", () async {
      //Arrange
      final expectResult = ApiErrorResult<ChangePasswordEntity>(dioException);
      when(
        mockAuthRepoImpl.changePassword(request: changePasswordRequest),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await changePasswordProfileUseCase.call(
        changePasswordRequest,
      );
      //Assert
      expect(result, isA<ApiErrorResult<ChangePasswordEntity>>());
      expect(
        (result as ApiErrorResult<ChangePasswordEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
      verify(
        mockAuthRepoImpl.changePassword(request: changePasswordRequest),
      ).called(1);
    });
  });
}
