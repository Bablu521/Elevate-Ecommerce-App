import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
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
            mockApiClient.forgetPassword(forgetPasswordRequest),
          ).thenAnswer((_) async => expectedResult);
          //Act
          var result = await authRemoteDataSourceImpl.forgetPassword(
            forgetPasswordRequestEntity,
          );
          //Assert
          verify(
            mockApiClient.forgetPassword(forgetPasswordRequest),
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
            mockApiClient.forgetPassword(forgetPasswordRequest),
          ).thenThrow(Exception(expectedError));
          //Act
          var result = await authRemoteDataSourceImpl.forgetPassword(
            forgetPasswordRequestEntity,
          );
          //Assert
          verify(
            mockApiClient.forgetPassword(forgetPasswordRequest),
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
            mockApiClient.verifyResetCode(verifyResetRequest),
          ).thenAnswer((_) async => expectedResult);
          //Act
          var result = await authRemoteDataSourceImpl.verifyResetCode(
            verifyResetRequestEntity,
          );
          //Assert
          verify(
            mockApiClient.verifyResetCode(verifyResetRequest),
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
            mockApiClient.verifyResetCode(verifyResetRequest),
          ).thenThrow(Exception(expectedError));
          //Act
          var result = await authRemoteDataSourceImpl.verifyResetCode(
            verifyResetRequestEntity,
          );
          //Assert
          verify(
            mockApiClient.verifyResetCode(verifyResetRequest),
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
            mockApiClient.resetPassword(resetPasswordRequest),
          ).thenAnswer((_) async => expectedResult);
          //Act
          var result = await authRemoteDataSourceImpl.resetPassword(
            resetPasswordRequestEntity,
          );
          //Assert
          verify(
            mockApiClient.resetPassword(resetPasswordRequest),
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
            mockApiClient.resetPassword(resetPasswordRequest),
          ).thenThrow(Exception(expectedError));
          //Act
          var result = await authRemoteDataSourceImpl.resetPassword(
            resetPasswordRequestEntity,
          );
          //Assert
          verify(
            mockApiClient.resetPassword(resetPasswordRequest),
          ).called(1);
          expect(result, isA<ApiErrorResult<ResetPasswordEntity>>());
          result as ApiErrorResult<ResetPasswordEntity>;
          expect(result.errorMessage, contains(expectedError));
        },
      );
    });
  });
  group('test AuthRemoteDataSourceImpl', () {
    late MockApiClient mockedApiClient;
    late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;
    late RegisterRequestEntity registerRequestEntity;
    late RegisterRequestDto registerRequestDto;

    setUp(() {
      mockedApiClient = MockApiClient();
      authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(mockedApiClient);
      registerRequestEntity = const RegisterRequestEntity(
        firstName: "fake-firstName",
        lastName: "fake-lastName",
        email: "fake-email",
        password: "fake-password",
        rePassword: "fake-rePassword",
        phone: "fake-phone",
        gender: "fake-gender",
      );
      registerRequestDto = RegisterRequestDto.fromDomain(registerRequestEntity);
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
          mockedApiClient.register(registerRequestDto),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await authRemoteDataSourceImpl.register(
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
      final expectedError = "Server Error";
      when(
        mockedApiClient.register(registerRequestDto),
      ).thenThrow(Exception(expectedError));

      //Act
      final result = await authRemoteDataSourceImpl.register(
        registerRequestEntity,
      );

      //Assert
      verify(mockedApiClient.register(registerRequestDto)).called(1);
      expect(result, isA<ApiErrorResult<RegisterEntity>>());
      result as ApiErrorResult<RegisterEntity>;
      expect(result.errorMessage, contains(expectedError));
    });

    test("Login Success", () async {
      //Arrange
      final LoginResponseDto response = LoginTestFixtures.fakeLoginResponse();
      final LoginRequestModel request = LoginTestFixtures.fakeLoginRequest();
      when(mockedApiClient.login(request)).thenAnswer((_) async => response);
      //Act
      final result = await authRemoteDataSourceImpl.login(
        loginRequest: request,
      );
      //Assert
      expect(result, isA<LoginResponseDto>());
      verify(mockedApiClient.login(request)).called(1);
    });
  });
}
