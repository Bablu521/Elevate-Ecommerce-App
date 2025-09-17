import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/data_source/auth_remote_data_source_impl.dart';
import 'package:elevate_ecommerce_app/api/mapper/auth/forget_password_mapper.dart';
import 'package:elevate_ecommerce_app/api/models/register_dto.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/auth/forget_password_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/auth/reset_password_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/auth/verify_reset_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/register_request_dto/register_request_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/forget_password_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/reset_password_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/verify_reset_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/profile_info_response/profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/register_response_dto/register_response_dto.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/forget_password_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/reset_password_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/verify_reset_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/forget_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/reset_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/verify_reset_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/register_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/register_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/login_fixtures.dart';
import '../../fixtures/profile_fixtures.dart';
import 'auth_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  group("test AuthRemoteDataSourceImpl", () {
    late MockApiClient mockApiClient;
    late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;

    setUp(() {
      mockApiClient = MockApiClient();
      authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(mockApiClient);
    });

    group('test register', () {
      late RegisterRequestEntity registerRequestEntity;
      late RegisterRequestDto registerRequestDto;

      setUp(() {
        mockApiClient = MockApiClient();
        authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(mockApiClient);
        registerRequestEntity = const RegisterRequestEntity(
          firstName: "fake-firstName",
          lastName: "fake-lastName",
          email: "fake-email",
          password: "fake-password",
          rePassword: "fake-rePassword",
          phone: "fake-phone",
          gender: "fake-gender",
        );
        registerRequestDto = RegisterRequestDto.fromDomain(
          registerRequestEntity,
        );
      });
      test(
        'when call register it should return RegisterEntity from Api with correct Parameters',
        () async {
          //Arrange

          final expectedResult = const RegisterResponseDto(
            message: "fake-message",
            token: "fake-token",
            user: RegisterDto(
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
            ),
          );
          when(
            mockApiClient.register(registerRequestDto),
          ).thenAnswer((_) async => expectedResult);

          //Act
          final result = await authRemoteDataSourceImpl.register(
            registerRequestEntity,
          );

          //Assert
          verify(mockApiClient.register(registerRequestDto)).called(1);
          expect(result, isA<ApiSuccessResult<RegisterEntity>>());
          result as ApiSuccessResult<RegisterEntity>;
          expect(result.data, expectedResult.user!.toRegisterEntity());
        },
      );

      test("when register failed it should return an error result", () async {
        //Arrange
        final expectedError = "Server Error";
        when(
          mockApiClient.register(registerRequestDto),
        ).thenThrow(Exception(expectedError));

        //Act
        final result = await authRemoteDataSourceImpl.register(
          registerRequestEntity,
        );

        //Assert
        verify(mockApiClient.register(registerRequestDto)).called(1);
        expect(result, isA<ApiErrorResult<RegisterEntity>>());
        result as ApiErrorResult<RegisterEntity>;
        expect(result.errorMessage, contains(expectedError));
      });

      test("Login Success", () async {
        //Arrange
        final LoginResponseDto response = LoginTestFixtures.fakeLoginResponse();
        final LoginRequestModel request = LoginTestFixtures.fakeLoginRequest();
        when(mockApiClient.login(request)).thenAnswer((_) async => response);
        //Act
        final result = await authRemoteDataSourceImpl.login(
          loginRequest: request,
        );
        //Assert
        expect(result, isA<LoginResponseDto>());
        verify(mockApiClient.login(request)).called(1);
      });
    });

    group("test forgetPassword", () {
      late ForgetPasswordRequestEntity forgetPasswordRequestEntity;
      late ForgetPasswordRequest forgetPasswordRequest;

      setUp(() {
        forgetPasswordRequestEntity = const ForgetPasswordRequestEntity(
          email: "fake-email",
        );
        forgetPasswordRequest = forgetPasswordRequestEntity.fromDomain();
      });

      test(
        "when call forgetPassword it should return ForgetPasswordEntity from Api with correct parameters",
        () async {
          //Arrange
          final expectedResult = ForgetPasswordResponse(
            message: "fake-message",
            info: "fake-info",
          );
          when(
            mockApiClient.forgetPassword(forgetPasswordRequest),
          ).thenAnswer((_) async => expectedResult);
          //Act
          final result = await authRemoteDataSourceImpl.forgetPassword(
            forgetPasswordRequestEntity,
          );
          //Assert
          verify(mockApiClient.forgetPassword(forgetPasswordRequest)).called(1);
          expect(result, isA<ApiSuccessResult<ForgetPasswordEntity>>());
          result as ApiSuccessResult<ForgetPasswordEntity>;
          expect(
            result.data.message,
            equals(expectedResult.toEntity().message),
          );
          expect(result.data.info, equals(expectedResult.toEntity().info));
        },
      );

      test(
        "when forgetPassword failed it should return an error result",
        () async {
          //Arrange
          final expectedError = "Server Error";
          when(
            mockApiClient.forgetPassword(forgetPasswordRequest),
          ).thenThrow(Exception(expectedError));
          //Act
          final result = await authRemoteDataSourceImpl.forgetPassword(
            forgetPasswordRequestEntity,
          );
          //Assert
          verify(mockApiClient.forgetPassword(forgetPasswordRequest)).called(1);
          expect(result, isA<ApiErrorResult<ForgetPasswordEntity>>());
          result as ApiErrorResult<ForgetPasswordEntity>;
          expect(result.errorMessage, contains(expectedError));
        },
      );
    });

    group("test verifyResetCode", () {
      late VerifyResetRequestEntity verifyResetRequestEntity;
      late VerifyResetRequest verifyResetRequest;

      setUp(() {
        verifyResetRequestEntity = const VerifyResetRequestEntity(
          resetCode: "fake-reset-code",
        );
        verifyResetRequest = verifyResetRequestEntity.fromDomain();
      });

      test(
        "when call verifyResetCode it should return VerifyResetEntity from Api with correct parameters",
        () async {
          //Arrange
          final expectedResult = VerifyResetResponse(status: "fake-status");
          when(
            mockApiClient.verifyResetCode(verifyResetRequest),
          ).thenAnswer((_) async => expectedResult);
          //Act
          final result = await authRemoteDataSourceImpl.verifyResetCode(
            verifyResetRequestEntity,
          );
          //Assert
          verify(mockApiClient.verifyResetCode(verifyResetRequest)).called(1);
          expect(result, isA<ApiSuccessResult<VerifyResetEntity>>());
          result as ApiSuccessResult<VerifyResetEntity>;
          expect(result.data.status, equals(expectedResult.toEntity().status));
        },
      );

      test(
        "when verifyResetCode failed it should return an error result",
        () async {
          //Arrange
          final expectedError = "Server Error";
          when(
            mockApiClient.verifyResetCode(verifyResetRequest),
          ).thenThrow(Exception(expectedError));
          //Act
          final result = await authRemoteDataSourceImpl.verifyResetCode(
            verifyResetRequestEntity,
          );
          //Assert
          verify(mockApiClient.verifyResetCode(verifyResetRequest)).called(1);
          expect(result, isA<ApiErrorResult<VerifyResetEntity>>());
          result as ApiErrorResult<VerifyResetEntity>;
          expect(result.errorMessage, contains(expectedError));
        },
      );
    });

    group("test resetPassword", () {
      late ResetPasswordRequestEntity resetPasswordRequestEntity;
      late ResetPasswordRequest resetPasswordRequest;

      setUp(() {
        resetPasswordRequestEntity = const ResetPasswordRequestEntity(
          email: "fake-email",
          newPassword: "fake-new-password",
        );
        resetPasswordRequest = resetPasswordRequestEntity.fromDomain();
      });

      test(
        "when call resetPassword it should return ResetPasswordEntity from Api with correct parameters",
        () async {
          //Arrange
          final expectedResult = ResetPasswordResponse(
            message: "fake-message",
            token: "fake-token",
          );
          when(
            mockApiClient.resetPassword(resetPasswordRequest),
          ).thenAnswer((_) async => expectedResult);
          //Act
          final result = await authRemoteDataSourceImpl.resetPassword(
            resetPasswordRequestEntity,
          );
          //Assert
          verify(mockApiClient.resetPassword(resetPasswordRequest)).called(1);
          expect(result, isA<ApiSuccessResult<ResetPasswordEntity>>());
          result as ApiSuccessResult<ResetPasswordEntity>;
          expect(
            result.data.message,
            equals(expectedResult.toEntity().message),
          );
        },
      );

      test(
        "when resetPassword failed it should return an error result",
        () async {
          //Arrange
          final expectedError = "Server Error";
          when(
            mockApiClient.resetPassword(resetPasswordRequest),
          ).thenThrow(Exception(expectedError));
          //Act
          final result = await authRemoteDataSourceImpl.resetPassword(
            resetPasswordRequestEntity,
          );
          //Assert
          verify(mockApiClient.resetPassword(resetPasswordRequest)).called(1);
          expect(result, isA<ApiErrorResult<ResetPasswordEntity>>());
          result as ApiErrorResult<ResetPasswordEntity>;
          expect(result.errorMessage, contains(expectedError));
        },
      );
    });
  });
  group("profile functionality success call", () {
    late MockApiClient mockedApiClient;
    setUp(() {
      mockedApiClient = MockApiClient();
    });
    test("get user info ApiClient success", () async {
      ///AAA
      ///Arrange
      final ProfileInfoResponseDto profileInfoResponseDto =
          ProfileFixtures.fakeProfileInfoResponse;
      when(
        mockedApiClient.getProfileData(),
      ).thenAnswer((_) async => profileInfoResponseDto);

      ///Act
      final result = await mockedApiClient.getProfileData();

      ///Assert
      expect(result, isA<ProfileInfoResponseDto>());
      expect(result.message, equals(profileInfoResponseDto.message));
    });
  });
}
