import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_remote_data_source.dart';
import 'package:elevate_ecommerce_app/data/repositories/auth_repo_impl.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/forget_password_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/reset_password_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/verify_reset_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/forget_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/reset_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/verify_reset_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repo_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource])
void main() {
  group('test AuthRepoImpl', () {
    late MockAuthRemoteDataSource mockAuthRemoteDataSource;
    late AuthRepoImpl authRepoImpl;

    setUp(() {
      mockAuthRemoteDataSource = MockAuthRemoteDataSource();
      authRepoImpl = AuthRepoImpl(mockAuthRemoteDataSource);
    });

    group("test forgetPassword", () {
      late ForgetPasswordRequestEntity forgetPasswordRequestEntity;

      setUp((){
        forgetPasswordRequestEntity = ForgetPasswordRequestEntity(
          email: "fake-email",
        );
      });

      test("when call forgetPassword it should return ForgetPasswordEntity from data source with right parameters", () async {
        //Arrange
        var expectedEntity = ForgetPasswordEntity(
          message: "fake-message",
          info: "fake-info",
        );
        var expectedResult = ApiSuccessResult<ForgetPasswordEntity>(expectedEntity);
        provideDummy<ApiResult<ForgetPasswordEntity>>(expectedResult);
        when(
          mockAuthRemoteDataSource.forgetPassword(forgetPasswordRequestEntity),
        ).thenAnswer((_) async => expectedResult);
        //Act
        var result = await authRepoImpl.forgetPassword(forgetPasswordRequestEntity);
        //Assert
        verify(
          mockAuthRemoteDataSource.forgetPassword(forgetPasswordRequestEntity),
        ).called(1);
        expect(result, isA<ApiSuccessResult<ForgetPasswordEntity>>());
        result as ApiSuccessResult<ForgetPasswordEntity>;
        expect(result.data.info, equals(expectedEntity.info));
        expect(result.data.message, equals(expectedEntity.message));
      });

      test("when forgetPassword failed it should return an error result", () async {
        //Arrange
        var expectedError = "Server Error";
        var expectedResult = ApiErrorResult<ForgetPasswordEntity>(expectedError);
        provideDummy<ApiResult<ForgetPasswordEntity>>(expectedResult);
        when(
          mockAuthRemoteDataSource.forgetPassword(forgetPasswordRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Call
        var result = await authRepoImpl.forgetPassword(forgetPasswordRequestEntity);

        //Assert
        verify(
          mockAuthRemoteDataSource.forgetPassword(forgetPasswordRequestEntity),
        ).called(1);
        expect(result, isA<ApiErrorResult<ForgetPasswordEntity>>());
        result as ApiErrorResult<ForgetPasswordEntity>;
        expect(result.errorMessage, expectedError);
      });

    });

    group("test verifyResetCode", () {
      late VerifyResetRequestEntity verifyResetRequestEntity;

      setUp((){
        verifyResetRequestEntity = VerifyResetRequestEntity(
          resetCode: "fake-reset-code",
        );
      });

      test("when call verifyResetCode it should return VerifyResetEntity from data source with right parameters", () async {
        //Arrange
        var expectedEntity = VerifyResetEntity(
          status: "fake-status",
        );
        var expectedResult = ApiSuccessResult<VerifyResetEntity>(expectedEntity);
        provideDummy<ApiResult<VerifyResetEntity>>(expectedResult);
        when(
          mockAuthRemoteDataSource.verifyResetCode(verifyResetRequestEntity),
        ).thenAnswer((_) async => expectedResult);
        //Act
        var result = await authRepoImpl.verifyResetCode(verifyResetRequestEntity);
        //Assert
        verify(
          mockAuthRemoteDataSource.verifyResetCode(verifyResetRequestEntity),
        ).called(1);
        expect(result, isA<ApiSuccessResult<VerifyResetEntity>>());
        result as ApiSuccessResult<VerifyResetEntity>;
        expect(result.data.status, equals(expectedEntity.status));
      });

      test("when verifyResetCode failed it should return an error result", () async {
        //Arrange
        var expectedError = "Server Error";
        var expectedResult = ApiErrorResult<VerifyResetEntity>(expectedError);
        provideDummy<ApiResult<VerifyResetEntity>>(expectedResult);
        when(
          mockAuthRemoteDataSource.verifyResetCode(verifyResetRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Call
        var result = await authRepoImpl.verifyResetCode(verifyResetRequestEntity);

        //Assert
        verify(
          mockAuthRemoteDataSource.verifyResetCode(verifyResetRequestEntity),
        ).called(1);
        expect(result, isA<ApiErrorResult<VerifyResetEntity>>());
        result as ApiErrorResult<VerifyResetEntity>;
        expect(result.errorMessage, expectedError);
      });

    });

    group("test resetPassword", () {
      late ResetPasswordRequestEntity resetPasswordRequestEntity;

      setUp((){
        resetPasswordRequestEntity = ResetPasswordRequestEntity(
          email: "fake-email",
          newPassword: "fake-new-password"
        );
      });

      test("when call resetPassword it should return ResetPasswordEntity from data source with right parameters", () async {
        //Arrange
        var expectedEntity = ResetPasswordEntity(
          message: "fake-message",
          token: "fake-token"
        );
        var expectedResult = ApiSuccessResult<ResetPasswordEntity>(expectedEntity);
        provideDummy<ApiResult<ResetPasswordEntity>>(expectedResult);
        when(
          mockAuthRemoteDataSource.resetPassword(resetPasswordRequestEntity),
        ).thenAnswer((_) async => expectedResult);
        //Act
        var result = await authRepoImpl.resetPassword(resetPasswordRequestEntity);
        //Assert
        verify(
          mockAuthRemoteDataSource.resetPassword(resetPasswordRequestEntity),
        ).called(1);
        expect(result, isA<ApiSuccessResult<ResetPasswordEntity>>());
        result as ApiSuccessResult<ResetPasswordEntity>;
        expect(result.data.token, equals(expectedEntity.token));
        expect(result.data.message, equals(expectedEntity.message));
      });

      test("when resetPassword failed it should return an error result", () async {
        //Arrange
        var expectedError = "Server Error";
        var expectedResult = ApiErrorResult<ResetPasswordEntity>(expectedError);
        provideDummy<ApiResult<ResetPasswordEntity>>(expectedResult);
        when(
          mockAuthRemoteDataSource.resetPassword(resetPasswordRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Call
        var result = await authRepoImpl.resetPassword(resetPasswordRequestEntity);

        //Assert
        verify(
          mockAuthRemoteDataSource.resetPassword(resetPasswordRequestEntity),
        ).called(1);
        expect(result, isA<ApiErrorResult<ResetPasswordEntity>>());
        result as ApiErrorResult<ResetPasswordEntity>;
        expect(result.errorMessage, expectedError);
      });

    });

  });
}