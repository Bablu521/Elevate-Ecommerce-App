import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/register_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/register_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/data/repositories/auth_repo_impl.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_remote_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'auth_repo_impl_test.mocks.dart';
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

@GenerateMocks([AuthRemoteDataSource,AuthLocalDataSource])
void main() {
  group('test AuthRepoImpl', () {
    late MockAuthRemoteDataSource mockedAuthRemoteDataSource;
    late MockAuthLocalDataSource mockAuthLocalDataSource;
    late AuthRepoImpl authRepoImpl;
    late RegisterRequestEntity registerRequestEntity;
    setUp(() {
      mockedAuthRemoteDataSource =
          MockAuthRemoteDataSource();
      mockAuthLocalDataSource = MockAuthLocalDataSource();
      authRepoImpl = AuthRepoImpl(
        authRemoteDataSource: mockAuthRemoteDataSource,
        authLocalDataSource: mockAuthLocalDataSource,
      );
      registerRequestEntity = RegisterRequestEntity(
        firstName: "fake-firstName",
        lastName: "fake-lastName",
        email: "fake-email",
        password: "fake-password",
        rePassword: "fake-rePassword",
        phone: "fake-phone",
        gender: "fake-gender",
      );
    });
    test(
      'when call register it should return RegisterEntity from data source with right parameters',
      () async {
        //Arrange
        var expectedEntity = RegisterEntity(
          firstName: "fake-firstName",
          lastName: "fake-lastName",
          email: "fake-email",
          gender: "fake-gender",
          phone: "fake-phone",
          photo: "fake-photo",
          role: "fake-role",
          wishlist: ["fake-wishlist"],
          id: "fake-id",
          addresses: ["fake-addresses"],
        );
        var expectedResult = ApiSuccessResult(expectedEntity);
        provideDummy<ApiResult<RegisterEntity>>(expectedResult);
        when(
          mockedAuthRemoteDataSource.register(registerRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Act
        var result = await authRepoImpl.register(registerRequestEntity);

        //Assert
        verify(
          mockedAuthRemoteDataSource.register(registerRequestEntity),
        ).called(1);
        expect(result, isA<ApiSuccessResult<RegisterEntity>>());
        result as ApiSuccessResult<RegisterEntity>;
        expect(result.data, expectedEntity);
      },
    );

    test("when register failed it should return an error result", () async {
      //Arrange
      var expectedError = "Server Error";
      var expectedResult = ApiErrorResult<RegisterEntity>(expectedError);
      provideDummy<ApiResult<RegisterEntity>>(expectedResult);
      when(
        mockedAuthRemoteDataSource.register(registerRequestEntity),
      ).thenAnswer((_) async => expectedResult);

      //Call
      var result = await authRepoImpl.register(registerRequestEntity);

      //Assert
      verify(
        mockedAuthRemoteDataSource.register(registerRequestEntity),
      ).called(1);
      expect(result, isA<ApiErrorResult<RegisterEntity>>());
      result as ApiErrorResult<RegisterEntity>;
      expect(result.errorMessage, expectedError);

    final LoginRequestModel loginRequestModel =
        LoginTestFixtures.fakeLoginRequest();
    test("login success", () async {
      ///Arrange
      final LoginResponseDto loginResponseDto =
          LoginTestFixtures.fakeLoginResponse();
      final LoginEntity loginEntity = LoginEntity(
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
}
