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
import 'package:elevate_ecommerce_app/data/data_source/auth_local_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';

import '../../fixtures/login_fixtures.dart';

@GenerateMocks([AuthRemoteDataSource,AuthLocalDataSource])
void main() {
  group('test AuthRepoImpl', () {
    late MockAuthRemoteDataSource mockedAuthRemoteDataSource;
    late MockAuthLocalDataSource mockedAuthLocalDataSource;
    late AuthRepoImpl authRepoImpl;
    late RegisterRequestEntity registerRequestEntity;
    setUp(() {
      mockedAuthRemoteDataSource =
          MockAuthRemoteDataSource();
      mockedAuthLocalDataSource = MockAuthLocalDataSource();
      authRepoImpl = AuthRepoImpl(
        mockedAuthRemoteDataSource,
        mockedAuthLocalDataSource,
      );
      registerRequestEntity = const RegisterRequestEntity(
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
        final expectedEntity = const RegisterEntity(
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
        final expectedResult = ApiSuccessResult(expectedEntity);
        provideDummy<ApiResult<RegisterEntity>>(expectedResult);
        when(
          mockedAuthRemoteDataSource.register(registerRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await authRepoImpl.register(registerRequestEntity);

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
      final expectedError = "Server Error";
      final expectedResult = ApiErrorResult<RegisterEntity>(expectedError);
      provideDummy<ApiResult<RegisterEntity>>(expectedResult);
      when(
        mockedAuthRemoteDataSource.register(registerRequestEntity),
      ).thenAnswer((_) async => expectedResult);

      //Call
      final result = await authRepoImpl.register(registerRequestEntity);

      //Assert
      verify(
        mockedAuthRemoteDataSource.register(registerRequestEntity),
      ).called(1);
      expect(result, isA<ApiErrorResult<RegisterEntity>>());
      result as ApiErrorResult<RegisterEntity>;
      expect(result.errorMessage, expectedError);
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
        mockedAuthRemoteDataSource.login(loginRequest: loginRequestModel),
      ).thenAnswer((_) async => loginResponseDto);

      ///Act
      final result = await authRepoImpl.login(
        loginRequestModel: loginRequestModel,
      );

      ///Assert
      expect(result, isA<ApiSuccessResult<LoginEntity>>());
      verify(
        mockedAuthRemoteDataSource.login(loginRequest: loginRequestModel),
      ).called(1);
      final resultEntity = result as ApiSuccessResult<LoginEntity>;
      expect(resultEntity.data.userToken, loginEntity.userToken);
      verify(
        mockedAuthLocalDataSource.saveUserToken(
          token: resultEntity.data.userToken,
        ),
      ).called(1);
      verify(
        mockedAuthLocalDataSource.saveUserRememberMe(
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
        mockedAuthRemoteDataSource.login(loginRequest: loginRequestModel),
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
      verifyNever(mockedAuthLocalDataSource.saveUserToken(token: "")).called(0);
      verifyNever(
        mockedAuthLocalDataSource.saveUserRememberMe(
          rememberMe: loginRequestModel.rememberMe,
        ),
      ).called(0);
    });
    test("login failure unknown exception", () async {
      //Arrange
      final exception = Exception("fake unknown exception");
      when(
        mockedAuthRemoteDataSource.login(loginRequest: loginRequestModel),
      ).thenThrow(exception);
      //Act
      final result = await authRepoImpl.login(
        loginRequestModel: loginRequestModel,
      );
      //Assert
      expect(result, isA<ApiErrorResult<LoginEntity>>());
      expect((result as ApiErrorResult<LoginEntity>).error, equals(exception));
      verifyNever(mockedAuthLocalDataSource.saveUserToken(token: "")).called(0);
      verifyNever(
        mockedAuthLocalDataSource.saveUserRememberMe(
          rememberMe: loginRequestModel.rememberMe,
        ),
      ).called(0);});

       test("user status login", () async {
      //Arrange
      const bool expectResult = true;
      //Act
      when(
        mockedAuthLocalDataSource.getUserStatus(),
      ).thenAnswer((_) async => expectResult);
      final bool result = await authRepoImpl.getUserStatus();
      //Assert
      expect(result, isA<bool>());
      expect(result, equals(expectResult));
      verify(mockedAuthLocalDataSource.getUserStatus()).called(1);
    });

     });
  }
