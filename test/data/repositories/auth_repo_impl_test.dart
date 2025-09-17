import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/forget_password_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/reset_password_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/verify_reset_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/forget_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/reset_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/verify_reset_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/change_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/profile_info_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/register_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/register_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/update_profile_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/upload_image_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/data/repositories/auth_repo_impl.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_remote_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../fixtures/profile_fixtures.dart';
import 'auth_repo_impl_test.mocks.dart';
import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_local_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';
import '../../fixtures/login_fixtures.dart';

@GenerateMocks([AuthRemoteDataSource, AuthLocalDataSource])
void main() {
  group('test AuthRepoImpl', () {
    late MockAuthRemoteDataSource mockedAuthRemoteDataSource;
    late MockAuthLocalDataSource mockedAuthLocalDataSource;
    late AuthRepoImpl authRepoImpl;
    late RegisterRequestEntity registerRequestEntity;
    final LoginRequestModel loginRequestModel =
        LoginTestFixtures.fakeLoginRequest();
    late ResetPasswordRequestEntity resetPasswordRequestEntity;
    late VerifyResetRequestEntity verifyResetRequestEntity;
    late ForgetPasswordRequestEntity forgetPasswordRequestEntity;

    setUp(() {
      mockedAuthRemoteDataSource = MockAuthRemoteDataSource();
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
      resetPasswordRequestEntity = const ResetPasswordRequestEntity(
        email: "fake-email",
        newPassword: "fake-new-password",
      );
      verifyResetRequestEntity = const VerifyResetRequestEntity(
        resetCode: "fake-reset-code",
      );
      forgetPasswordRequestEntity = const ForgetPasswordRequestEntity(
        email: "fake-email",
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
      ).called(0);
    });

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

    test("get profile info success", () async {
      //Arrange
      final fakeResponse = ProfileFixtures.fakeProfileInfoResponse;
      when(
        mockedAuthRemoteDataSource.getProfileInfo(),
      ).thenAnswer((_) async => fakeResponse);
      //Act
      final result = await authRepoImpl.getProfileInfo();
      //Assert
      expect(result, isA<ApiSuccessResult<ProfileInfoEntity>>());
      verify(mockedAuthRemoteDataSource.getProfileInfo()).called(1);
      final mapperResult = result as ApiSuccessResult<ProfileInfoEntity>;
      expect(mapperResult.data.email, fakeResponse.user?.email);
    });
    test("get profile info dio error", () async {
      //Arrange
      final DioException fakeDioError = DioException(
        requestOptions: RequestOptions(),
        message: "Fake Dio Message",
      );
      when(mockedAuthRemoteDataSource.getProfileInfo()).thenThrow(fakeDioError);
      //Act
      final result = await authRepoImpl.getProfileInfo();
      //Assert
      expect(result, isA<ApiErrorResult<ProfileInfoEntity>>());
      expect(
        (result as ApiErrorResult<ProfileInfoEntity>).errorMessage,
        equals(contains(fakeDioError.message)),
      );
      verify(mockedAuthRemoteDataSource.getProfileInfo()).called(1);
    });
    test("get profile info exception", () async {
      //Arrange
      final Exception fakeException = Exception("fake exception");
      when(
        mockedAuthRemoteDataSource.getProfileInfo(),
      ).thenThrow(fakeException);
      //Act
      final result = await authRepoImpl.getProfileInfo();
      //Assert
      expect(result, isA<ApiErrorResult<ProfileInfoEntity>>());
      expect(
        (result as ApiErrorResult<ProfileInfoEntity>).error,
        fakeException,
      );
      verify(mockedAuthRemoteDataSource.getProfileInfo()).called(1);
    });
    test("profile change password success", () async {
      //Arrange
      final fakeResponse = ProfileFixtures.fakeChangePasswordResponse;
      final fakeRequest = ProfileFixtures.fakeChangePasswordRequest;
      when(
        mockedAuthRemoteDataSource.changeUserPassword(request: fakeRequest),
      ).thenAnswer((_) async => fakeResponse);
      //Act
      final result = await authRepoImpl.changePassword(request: fakeRequest);
      //Assert
      expect(result, isA<ApiSuccessResult<ChangePasswordEntity>>());
      verify(
        mockedAuthRemoteDataSource.changeUserPassword(request: fakeRequest),
      ).called(1);
      verify(
        mockedAuthLocalDataSource.saveUserToken(token: fakeResponse.token),
      ).called(1);
      final mapperResult = result as ApiSuccessResult<ChangePasswordEntity>;
      expect(mapperResult.data.token, fakeResponse.token);
    });
    test("profile change password dio error", () async {
      //Arrange
      final DioException fakeDioError = DioException(
        requestOptions: RequestOptions(),
        message: "Fake Dio Message",
      );
      final fakeRequest = ProfileFixtures.fakeChangePasswordRequest;
      when(
        mockedAuthRemoteDataSource.changeUserPassword(request: fakeRequest),
      ).thenThrow(fakeDioError);
      //Act
      final result = await authRepoImpl.changePassword(request: fakeRequest);
      //Assert
      expect(result, isA<ApiErrorResult<ChangePasswordEntity>>());
      expect(
        (result as ApiErrorResult<ChangePasswordEntity>).errorMessage,
        equals(contains(fakeDioError.message)),
      );
      verify(
        mockedAuthRemoteDataSource.changeUserPassword(request: fakeRequest),
      ).called(1);
      verifyNever(
        mockedAuthLocalDataSource.saveUserToken(token: "fake token"),
      ).called(0);
    });
    test("profile change password exception", () async {
      //Arrange
      final Exception fakeException = Exception("fake exception");
      final fakeRequest = ProfileFixtures.fakeChangePasswordRequest;
      when(
        mockedAuthRemoteDataSource.changeUserPassword(request: fakeRequest),
      ).thenThrow(fakeException);
      //Act
      final result = await authRepoImpl.changePassword(request: fakeRequest);
      //Assert
      expect(result, isA<ApiErrorResult<ChangePasswordEntity>>());
      expect(
        (result as ApiErrorResult<ChangePasswordEntity>).error,
        fakeException,
      );
      verify(
        mockedAuthRemoteDataSource.changeUserPassword(request: fakeRequest),
      ).called(1);
      verifyNever(
        mockedAuthLocalDataSource.saveUserToken(token: "fake token"),
      ).called(0);
    });
    test("update profile info success", () async {
      //Arrange
      final fakeResponse = ProfileFixtures.fakeUpdateProfileResponse;
      final fakeRequest = ProfileFixtures.fakeUpdateProfileRequest;
      when(
        mockedAuthRemoteDataSource.updateProfileInfo(request: fakeRequest),
      ).thenAnswer((_) async => fakeResponse);
      //Act
      final result = await authRepoImpl.updateProfileInfo(request: fakeRequest);
      //Assert
      expect(result, isA<ApiSuccessResult<UpdateProfileEntity>>());
      verify(
        mockedAuthRemoteDataSource.updateProfileInfo(request: fakeRequest),
      ).called(1);
      final mapperResult = result as ApiSuccessResult<UpdateProfileEntity>;
      expect(mapperResult.data.email, fakeResponse.user?.email);
    });
    test("update profile info dio error", () async {
      //Arrange
      final DioException fakeDioError = DioException(
        requestOptions: RequestOptions(),
        message: "Fake Dio Message",
      );
      final fakeRequest = ProfileFixtures.fakeUpdateProfileRequest;
      when(
        mockedAuthRemoteDataSource.updateProfileInfo(request: fakeRequest),
      ).thenThrow(fakeDioError);
      //Act
      final result = await authRepoImpl.updateProfileInfo(request: fakeRequest);
      //Assert
      expect(result, isA<ApiErrorResult<UpdateProfileEntity>>());
      expect(
        (result as ApiErrorResult<UpdateProfileEntity>).errorMessage,
        equals(contains(fakeDioError.message)),
      );
      verify(
        mockedAuthRemoteDataSource.updateProfileInfo(request: fakeRequest),
      ).called(1);
    });
    test("update profile info exception", () async {
      //Arrange
      final Exception fakeException = Exception("fake exception");
      final fakeRequest = ProfileFixtures.fakeUpdateProfileRequest;
      when(
        mockedAuthRemoteDataSource.updateProfileInfo(request: fakeRequest),
      ).thenThrow(fakeException);
      //Act
      final result = await authRepoImpl.updateProfileInfo(request: fakeRequest);
      //Assert
      expect(result, isA<ApiErrorResult<UpdateProfileEntity>>());
      expect(
        (result as ApiErrorResult<UpdateProfileEntity>).error,
        fakeException,
      );
      verify(
        mockedAuthRemoteDataSource.updateProfileInfo(request: fakeRequest),
      ).called(1);
    });
    test("upload image profile success", () async {
      //Arrange
      final fakeResponse = ProfileFixtures.fakeUploadImageResponse;
      final MultipartFile fakeRequest = MultipartFile.fromString(
        'dummy data',
        filename: 'profile.png',
      );
      when(
        mockedAuthRemoteDataSource.uploadProfileImage(request: fakeRequest),
      ).thenAnswer((_) async => fakeResponse);
      //Act
      final result = await authRepoImpl.uploadImageProfile(photo: fakeRequest);
      //Assert
      expect(result, isA<ApiSuccessResult<UploadImageEntity>>());
      verify(
        mockedAuthRemoteDataSource.uploadProfileImage(request: fakeRequest),
      ).called(1);
      final mapperResult = result as ApiSuccessResult<UploadImageEntity>;
      expect(mapperResult.data.message, fakeResponse.message);
    });
    test("upload image profile dio error", () async {
      //Arrange
      final DioException fakeDioError = DioException(
        requestOptions: RequestOptions(),
        message: "Fake Dio Message",
      );
      final MultipartFile fakeRequest = MultipartFile.fromString(
        'dummy data',
        filename: 'profile.png',
      );
      when(
        mockedAuthRemoteDataSource.uploadProfileImage(request: fakeRequest),
      ).thenThrow(fakeDioError);
      //Act
      final result = await authRepoImpl.uploadImageProfile(photo: fakeRequest);
      //Assert
      expect(result, isA<ApiErrorResult<UploadImageEntity>>());
      expect(
        (result as ApiErrorResult<UploadImageEntity>).errorMessage,
        equals(contains(fakeDioError.message)),
      );
      verify(
        mockedAuthRemoteDataSource.uploadProfileImage(request: fakeRequest),
      ).called(1);
    });
    test("upload image profile exception", () async {
      //Arrange
      final Exception fakeException = Exception("fake exception");
      final MultipartFile fakeRequest = MultipartFile.fromString(
        'dummy data',
        filename: 'profile.png',
      );
      when(
        mockedAuthRemoteDataSource.uploadProfileImage(request: fakeRequest),
      ).thenThrow(fakeException);
      //Act
      final result = await authRepoImpl.uploadImageProfile(photo: fakeRequest);
      //Assert
      expect(result, isA<ApiErrorResult<UploadImageEntity>>());
      expect(
        (result as ApiErrorResult<UploadImageEntity>).error,
        fakeException,
      );
      verify(
        mockedAuthRemoteDataSource.uploadProfileImage(request: fakeRequest),
      ).called(1);
    });
    test(
      "when call resetPassword it should return ResetPasswordEntity from data source with right parameters",
      () async {
        //Arrange
        final expectedEntity = ResetPasswordEntity(message: "fake-message");
        final expectedResult = ApiSuccessResult<ResetPasswordEntity>(
          expectedEntity,
        );
        provideDummy<ApiResult<ResetPasswordEntity>>(expectedResult);
        when(
          mockedAuthRemoteDataSource.resetPassword(resetPasswordRequestEntity),
        ).thenAnswer((_) async => expectedResult);
        //Act
        final result = await authRepoImpl.resetPassword(
          resetPasswordRequestEntity,
        );
        //Assert
        verify(
          mockedAuthRemoteDataSource.resetPassword(resetPasswordRequestEntity),
        ).called(1);
        expect(result, isA<ApiSuccessResult<ResetPasswordEntity>>());
        result as ApiSuccessResult<ResetPasswordEntity>;
        expect(result.data.message, equals(expectedEntity.message));
      },
    );

    test(
      "when resetPassword failed it should return an error result",
      () async {
        //Arrange
        final expectedError = "Server Error";
        final expectedResult = ApiErrorResult<ResetPasswordEntity>(
          expectedError,
        );
        provideDummy<ApiResult<ResetPasswordEntity>>(expectedResult);
        when(
          mockedAuthRemoteDataSource.resetPassword(resetPasswordRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Call
        final result = await authRepoImpl.resetPassword(
          resetPasswordRequestEntity,
        );

        //Assert
        verify(
          mockedAuthRemoteDataSource.resetPassword(resetPasswordRequestEntity),
        ).called(1);
        expect(result, isA<ApiErrorResult<ResetPasswordEntity>>());
        result as ApiErrorResult<ResetPasswordEntity>;
        expect(result.errorMessage, expectedError);
      },
    );
    test(
      "when call verifyResetCode it should return VerifyResetEntity from data source with right parameters",
      () async {
        //Arrange
        final expectedEntity = VerifyResetEntity(status: "fake-status");
        final expectedResult = ApiSuccessResult<VerifyResetEntity>(
          expectedEntity,
        );
        provideDummy<ApiResult<VerifyResetEntity>>(expectedResult);
        when(
          mockedAuthRemoteDataSource.verifyResetCode(verifyResetRequestEntity),
        ).thenAnswer((_) async => expectedResult);
        //Act
        final result = await authRepoImpl.verifyResetCode(
          verifyResetRequestEntity,
        );
        //Assert
        verify(
          mockedAuthRemoteDataSource.verifyResetCode(verifyResetRequestEntity),
        ).called(1);
        expect(result, isA<ApiSuccessResult<VerifyResetEntity>>());
        result as ApiSuccessResult<VerifyResetEntity>;
        expect(result.data.status, equals(expectedEntity.status));
      },
    );

    test(
      "when verifyResetCode failed it should return an error result",
      () async {
        //Arrange
        final expectedError = "Server Error";
        final expectedResult = ApiErrorResult<VerifyResetEntity>(expectedError);
        provideDummy<ApiResult<VerifyResetEntity>>(expectedResult);
        when(
          mockedAuthRemoteDataSource.verifyResetCode(verifyResetRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Call
        final result = await authRepoImpl.verifyResetCode(
          verifyResetRequestEntity,
        );

        //Assert
        verify(
          mockedAuthRemoteDataSource.verifyResetCode(verifyResetRequestEntity),
        ).called(1);
        expect(result, isA<ApiErrorResult<VerifyResetEntity>>());
        result as ApiErrorResult<VerifyResetEntity>;
        expect(result.errorMessage, expectedError);
      },
    );
    test(
      "when call forgetPassword it should return ForgetPasswordEntity from data source with right parameters",
      () async {
        //Arrange
        final expectedEntity = ForgetPasswordEntity(
          message: "fake-message",
          info: "fake-info",
        );
        final expectedResult = ApiSuccessResult<ForgetPasswordEntity>(
          expectedEntity,
        );
        provideDummy<ApiResult<ForgetPasswordEntity>>(expectedResult);
        when(
          mockedAuthRemoteDataSource.forgetPassword(
            forgetPasswordRequestEntity,
          ),
        ).thenAnswer((_) async => expectedResult);
        //Act
        final result = await authRepoImpl.forgetPassword(
          forgetPasswordRequestEntity,
        );
        //Assert
        verify(
          mockedAuthRemoteDataSource.forgetPassword(
            forgetPasswordRequestEntity,
          ),
        ).called(1);
        expect(result, isA<ApiSuccessResult<ForgetPasswordEntity>>());
        result as ApiSuccessResult<ForgetPasswordEntity>;
        expect(result.data.info, equals(expectedEntity.info));
        expect(result.data.message, equals(expectedEntity.message));
      },
    );

    test(
      "when forgetPassword failed it should return an error result",
      () async {
        //Arrange
        final expectedError = "Server Error";
        final expectedResult = ApiErrorResult<ForgetPasswordEntity>(
          expectedError,
        );
        provideDummy<ApiResult<ForgetPasswordEntity>>(expectedResult);
        when(
          mockedAuthRemoteDataSource.forgetPassword(
            forgetPasswordRequestEntity,
          ),
        ).thenAnswer((_) async => expectedResult);

        //Call
        final result = await authRepoImpl.forgetPassword(
          forgetPasswordRequestEntity,
        );

        //Assert
        verify(
          mockedAuthRemoteDataSource.forgetPassword(
            forgetPasswordRequestEntity,
          ),
        ).called(1);
        expect(result, isA<ApiErrorResult<ForgetPasswordEntity>>());
        result as ApiErrorResult<ForgetPasswordEntity>;
        expect(result.errorMessage, expectedError);
      },
    );
  });
}
