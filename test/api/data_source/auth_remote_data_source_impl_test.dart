import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/data_source/auth_remote_data_source_impl.dart';
import 'package:elevate_ecommerce_app/api/mapper/auth/forget_password_mapper.dart';
import 'package:elevate_ecommerce_app/api/mapper/auth/reset_password_mapper.dart';
import 'package:elevate_ecommerce_app/api/mapper/auth/verify_reset_mapper.dart';
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
import '../client/api_client_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
    group('test AuthRemoteDataSourceImpl', () {
    late MockApiClient mockedApiClient;
    late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;
    late RegisterRequestEntity registerRequestEntity;
    late RegisterRequestDto registerRequestDto;

    setUp(() {
      mockedApiClient = MockApiClient();
      authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(mockedApiClient);
      registerRequestEntity = RegisterRequestEntity(
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

        var expectedResult = RegisterResponseDto(
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
          mockedApiClient.register(registerRequestDto),
        ).thenAnswer((_) async => expectedResult);

        //Act
        var result = await authRemoteDataSourceImpl.register(
          registerRequestEntity,
        );

        //Assert
        verify(mockedApiClient.register(registerRequestDto)).called(1);
        expect(result, isA<ApiSuccessResult<RegisterEntity>>());
        result as ApiSuccessResult<RegisterEntity>;
        expect(result.data, expectedResult.user!.toRegisterEntity());
      },
    );

    test("when register failed it should return an error result", () async {
      //Arrange
      var expectedError = "Server Error";
      when(
        mockedApiClient.register(registerRequestDto),
      ).thenThrow(Exception(expectedError));

      //Act
      var result = await authRemoteDataSourceImpl.register(
        registerRequestEntity,
      );

      //Assert
      verify(mockedApiClient.register(registerRequestDto)).called(1);
      expect(result, isA<ApiErrorResult<RegisterEntity>>());
      result as ApiErrorResult<RegisterEntity>;
      expect(result.errorMessage, contains(expectedError));
    });
  });
  group("AuthRemoteDataSourceImpl Test", () {
    late MockApiClient mockApiClient;
    late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;
    setUp(() {
      mockApiClient = MockApiClient();
      authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(mockApiClient);
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

  group("test AuthRemoteDataSourceImpl", () {
    late MockApiClient mockApiClient;
    late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;

    setUp(() {
      mockApiClient = MockApiClient();
      authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(mockApiClient);
    });

    group("test forgetPassword", () {
      late ForgetPasswordRequestEntity forgetPasswordRequestEntity;
      late ForgetPasswordRequest forgetPasswordRequest;

      setUp(() {
        forgetPasswordRequestEntity = ForgetPasswordRequestEntity(
          email: "fake-email",
        );
        forgetPasswordRequest = ForgetPasswordMapper.fromDomain(
          forgetPasswordRequestEntity,
        );
      });

      test(
        "when call forgetPassword it should return ForgetPasswordEntity from Api with correct parameters",
        () async {
          //Arrange
          var expectedResult = ForgetPasswordResponse(
            message: "fake-message",
            info: "fake-info",
          );
          when(
            mockApiClient.forgetPassword(
              argThat(
                predicate<ForgetPasswordRequest>(
                  (req) => req.email == forgetPasswordRequest.email,
                ),
              ),
            ),
          ).thenAnswer((_) async => expectedResult);
          //Act
          var result = await authRemoteDataSourceImpl.forgetPassword(
            forgetPasswordRequestEntity,
          );
          //Assert
          verify(
            mockApiClient.forgetPassword(
              argThat(
                predicate<ForgetPasswordRequest>(
                  (req) => req.email == forgetPasswordRequest.email,
                ),
              ),
            ),
          ).called(1);
          expect(result, isA<ApiSuccessResult<ForgetPasswordEntity>>());
          result as ApiSuccessResult<ForgetPasswordEntity>;
          expect(
            result.data.message,
            equals(ForgetPasswordMapper.fromResponse(expectedResult).message),
          );
          expect(
            result.data.info,
            equals(ForgetPasswordMapper.fromResponse(expectedResult).info),
          );
        },
      );

      test(
        "when forgetPassword failed it should return an error result",
        () async {
          //Arrange
          var expectedError = "Server Error";
          when(
            mockApiClient.forgetPassword(
              argThat(
                predicate<ForgetPasswordRequest>(
                  (req) => req.email == forgetPasswordRequest.email,
                ),
              ),
            ),
          ).thenThrow(Exception(expectedError));
          //Act
          var result = await authRemoteDataSourceImpl.forgetPassword(
            forgetPasswordRequestEntity,
          );
          //Assert
          verify(
            mockApiClient.forgetPassword(
              argThat(
                predicate<ForgetPasswordRequest>(
                  (req) => req.email == forgetPasswordRequest.email,
                ),
              ),
            ),
          ).called(1);
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
        verifyResetRequestEntity = VerifyResetRequestEntity(
          resetCode: "fake-reset-code",
        );
        verifyResetRequest = VerifyResetMapper.fromDomain(
          verifyResetRequestEntity,
        );
      });

      test(
        "when call verifyResetCode it should return VerifyResetEntity from Api with correct parameters",
        () async {
          //Arrange
          var expectedResult = VerifyResetResponse(status: "fake-status");
          when(
            mockApiClient.verifyResetCode(
              argThat(
                predicate<VerifyResetRequest>(
                  (req) => req.resetCode == verifyResetRequest.resetCode,
                ),
              ),
            ),
          ).thenAnswer((_) async => expectedResult);
          //Act
          var result = await authRemoteDataSourceImpl.verifyResetCode(
            verifyResetRequestEntity,
          );
          //Assert
          verify(
            mockApiClient.verifyResetCode(
              argThat(
                predicate<VerifyResetRequest>(
                  (req) => req.resetCode == verifyResetRequest.resetCode,
                ),
              ),
            ),
          ).called(1);
          expect(result, isA<ApiSuccessResult<VerifyResetEntity>>());
          result as ApiSuccessResult<VerifyResetEntity>;
          expect(
            result.data.status,
            equals(VerifyResetMapper.fromResponse(expectedResult).status),
          );
        },
      );

      test(
        "when verifyResetCode failed it should return an error result",
        () async {
          //Arrange
          var expectedError = "Server Error";
          when(
            mockApiClient.verifyResetCode(
              argThat(
                predicate<VerifyResetRequest>(
                  (req) => req.resetCode == verifyResetRequest.resetCode,
                ),
              ),
            ),
          ).thenThrow(Exception(expectedError));
          //Act
          var result = await authRemoteDataSourceImpl.verifyResetCode(
            verifyResetRequestEntity,
          );
          //Assert
          verify(
            mockApiClient.verifyResetCode(
              argThat(
                predicate<VerifyResetRequest>(
                  (req) => req.resetCode == verifyResetRequest.resetCode,
                ),
              ),
            ),
          ).called(1);
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
        resetPasswordRequestEntity = ResetPasswordRequestEntity(
          email: "fake-email",
          newPassword: "fake-new-password",
        );
        resetPasswordRequest = ResetPasswordMapper.fromDomain(
          resetPasswordRequestEntity,
        );
      });

      test(
        "when call resetPassword it should return ResetPasswordEntity from Api with correct parameters",
        () async {
          //Arrange
          var expectedResult = ResetPasswordResponse(
            message: "fake-message",
            token: "fake-token",
          );
          when(
            mockApiClient.resetPassword(
              argThat(
                predicate<ResetPasswordRequest>(
                  (req) =>
                      req.email == resetPasswordRequest.email &&
                      req.newPassword == resetPasswordRequest.newPassword,
                ),
              ),
            ),
          ).thenAnswer((_) async => expectedResult);
          //Act
          var result = await authRemoteDataSourceImpl.resetPassword(
            resetPasswordRequestEntity,
          );
          //Assert
          verify(
            mockApiClient.resetPassword(
              argThat(
                predicate<ResetPasswordRequest>(
                  (req) =>
                      req.email == resetPasswordRequest.email &&
                      req.newPassword == resetPasswordRequest.newPassword,
                ),
              ),
            ),
          ).called(1);
          expect(result, isA<ApiSuccessResult<ResetPasswordEntity>>());
          result as ApiSuccessResult<ResetPasswordEntity>;
          expect(
            result.data.message,
            equals(ResetPasswordMapper.fromResponse(expectedResult).message),
          );
          expect(
            result.data.token,
            equals(ResetPasswordMapper.fromResponse(expectedResult).token),
          );
        },
      );

      test(
        "when resetPassword failed it should return an error result",
        () async {
          //Arrange
          var expectedError = "Server Error";
          when(
            mockApiClient.resetPassword(
              argThat(
                predicate<ResetPasswordRequest>(
                  (req) =>
                      req.email == resetPasswordRequest.email &&
                      req.newPassword == resetPasswordRequest.newPassword,
                ),
              ),
            ),
          ).thenThrow(Exception(expectedError));
          //Act
          var result = await authRemoteDataSourceImpl.resetPassword(
            resetPasswordRequestEntity,
          );
          //Assert
          verify(
            mockApiClient.resetPassword(
              argThat(
                predicate<ResetPasswordRequest>(
                  (req) =>
                      req.email == resetPasswordRequest.email &&
                      req.newPassword == resetPasswordRequest.newPassword,
                ),
              ),
            ),
          ).called(1);
          expect(result, isA<ApiErrorResult<ResetPasswordEntity>>());
          result as ApiErrorResult<ResetPasswordEntity>;
          expect(result.errorMessage, contains(expectedError));
        },
      );
    });
  });
}
