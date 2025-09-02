import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_local_data_source.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_remote_data_source.dart';
import 'package:elevate_ecommerce_app/data/repositories/auth_repo_impl.dart';
import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/login_fixtures.dart';
import 'auth_repo_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource, AuthLocalDataSource])
void main() {
  group("group test login impl", () {
    late MockAuthRemoteDataSource mockAuthRemoteDataSource;
    late AuthRepoImpl authRepoImpl;
    late MockAuthLocalDataSource mockAuthLocalDataSource;
    setUp(() {
      mockAuthRemoteDataSource = MockAuthRemoteDataSource();
      mockAuthLocalDataSource = MockAuthLocalDataSource();
      authRepoImpl = AuthRepoImpl(
        authRemoteDataSource: mockAuthRemoteDataSource,
        authLocalDataSource: mockAuthLocalDataSource,
      );
    });
    final LoginRequestModel loginRequestModel =
        LoginTestFixtures.fakeLoginRequest();
    test("login success", () async {
      ///Arrange
      final LoginResponseDto loginResponseDto =
          LoginTestFixtures.fakeLoginResponse();
      final LoginEntity loginEntity = const LoginEntity(
        userToken: "fake_token",
        message: "success",
      );
      when(
        mockAuthRemoteDataSource.login(loginRequest: loginRequestModel),
      ).thenAnswer((_) async => loginResponseDto);

      ///Act
      final result = await authRepoImpl.login(
        loginRequestModel: loginRequestModel,
      );

      ///Assert
      expect(result, isA<ApiSuccessResult<LoginEntity>>());
      verify(
        mockAuthRemoteDataSource.login(loginRequest: loginRequestModel),
      ).called(1);
      final resultEntity = result as ApiSuccessResult<LoginEntity>;
      expect(resultEntity.data.userToken, loginEntity.userToken);
      verify(
        mockAuthLocalDataSource.saveUserToken(
          token: resultEntity.data.userToken,
        ),
      ).called(1);
      verify(
        mockAuthLocalDataSource.saveUserRememberMe(
          rememberMe: loginRequestModel.rememberMe,
        ),
      ).called(1);
    });
    test("login failure dio exception", () async {
      //Arrange
      final dioError = DioException(
        requestOptions: RequestOptions(),
        message: "fake dio error",
      );
      when(
        mockAuthRemoteDataSource.login(loginRequest: loginRequestModel),
      ).thenThrow(dioError);
      //Act
      final result = await authRepoImpl.login(
        loginRequestModel: loginRequestModel,
      );
      //Assert
      expect(result, isA<ApiErrorResult<LoginEntity>>());
      expect(
        (result as ApiErrorResult<LoginEntity>).errorMessage,
        equals(contains(dioError.message)),
      );
      verifyNever(mockAuthLocalDataSource.saveUserToken(token: "")).called(0);
      verifyNever(
        mockAuthLocalDataSource.saveUserRememberMe(
          rememberMe: loginRequestModel.rememberMe,
        ),
      ).called(0);
    });
    test("login failure unknown exception", () async {
      //Arrange
      final exception = Exception("fake unknown exception");
      when(
        mockAuthRemoteDataSource.login(loginRequest: loginRequestModel),
      ).thenThrow(exception);
      //Act
      final result = await authRepoImpl.login(
        loginRequestModel: loginRequestModel,
      );
      //Assert
      expect(result, isA<ApiErrorResult<LoginEntity>>());
      expect((result as ApiErrorResult<LoginEntity>).error, equals(exception));
      verifyNever(mockAuthLocalDataSource.saveUserToken(token: "")).called(0);
      verifyNever(
        mockAuthLocalDataSource.saveUserRememberMe(
          rememberMe: loginRequestModel.rememberMe,
        ),
      ).called(0);
    });
  });
  group("test user process", () {
    late MockAuthRemoteDataSource mockAuthRemoteDataSource;
    late AuthRepoImpl authRepoImpl;
    late MockAuthLocalDataSource mockAuthLocalDataSource;
    setUp(() {
      mockAuthRemoteDataSource = MockAuthRemoteDataSource();
      mockAuthLocalDataSource = MockAuthLocalDataSource();
      authRepoImpl = AuthRepoImpl(
        authRemoteDataSource: mockAuthRemoteDataSource,
        authLocalDataSource: mockAuthLocalDataSource,
      );
    });
    test("user status login", () async {
      //Arrange
      const bool expectResult = true;
      //Act
      when(
        mockAuthLocalDataSource.getUserStatus(),
      ).thenAnswer((_) async => expectResult);
      final bool result = await authRepoImpl.getUserStatus();
      //Assert
      expect(result, isA<bool>());
      expect(result, equals(expectResult));
      verify(mockAuthLocalDataSource.getUserStatus()).called(1);
    });
    test("userLogout should call dataSource", () async {
      // Arrange
      when(
        mockAuthLocalDataSource.userLogout(),
      ).thenAnswer((_) async => Future.value());

      // Act
      await authRepoImpl.userLogout();

      // Assert
      verify(mockAuthLocalDataSource.userLogout()).called(1);
    });
  });
}
