import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/repositories/auth_repo_impl.dart';
import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/login_fixtures.dart';
import 'login_use_case_test.mocks.dart';

@GenerateMocks([AuthRepoImpl])
void main() {
  late MockAuthRepoImpl mockAuthRepoImpl;
  late LoginUseCase loginUseCase;
  setUpAll(() {
    mockAuthRepoImpl = MockAuthRepoImpl();
    loginUseCase = LoginUseCase(mockAuthRepoImpl);
  });
  group("Login UseCase Test", () {
    final LoginRequestModel loginRequestModel =
        LoginTestFixtures.fakeLoginRequest();
    test("login use case success", () async {
      ///Arrange
      final LoginEntity loginEntity = LoginEntity(
        userToken: "fake_token",
        message: "success",
      );
      when(
        mockAuthRepoImpl.login(loginRequestModel: loginRequestModel),
      ).thenAnswer((_) async => ApiSuccessResult<LoginEntity>(loginEntity));

      ///Act
      final result = await loginUseCase.call(requestModel: loginRequestModel);

      ///Assert
      expect(result, isA<ApiSuccessResult<LoginEntity>>());
      verify(
        mockAuthRepoImpl.login(loginRequestModel: loginRequestModel),
      ).called(1);
      final resultEntity = result as ApiSuccessResult<LoginEntity>;
      expect(resultEntity.data.userToken, loginEntity.userToken);
    });
    test("login use case failure dio exception", () async {
      //Arrange
      final dioError = DioException(
        requestOptions: RequestOptions(),
        message: "fake dio error",
      );
      when(
        mockAuthRepoImpl.login(loginRequestModel: loginRequestModel),
      ).thenThrow(dioError);
      //Act
      final result = await loginUseCase.call(requestModel: loginRequestModel);
      //Assert
      expect(result, isA<ApiErrorResult<LoginEntity>>());
      expect(
        (result as ApiErrorResult<LoginEntity>).errorMessage,
        equals(contains(dioError.message)),
      );
    });
    test("login use case failure unknown exception", () async {
      //Arrange
      final exception = Exception("fake unknown exception");
      when(
        mockAuthRepoImpl.login(loginRequestModel: loginRequestModel),
      ).thenThrow(exception);
      //Act
      final result = await loginUseCase.call(requestModel: loginRequestModel);
      //Assert
      expect(result, isA<ApiErrorResult<LoginEntity>>());
      expect((result as ApiErrorResult<LoginEntity>).error, equals(exception));
    });
  });
}
