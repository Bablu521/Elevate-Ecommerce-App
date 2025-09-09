import 'package:elevate_ecommerce_app/api/mapper/auth/forget_password_mapper.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/forget_password_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/reset_password_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/verify_reset_response.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/forget_password_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/reset_password_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/verify_reset_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test ForgetPasswordMapper", () {
    test(
      'when call toEntity with null values should return ForgetPasswordEntity with empty values',
      () {
        //Arrange
        final response = ForgetPasswordResponse(message: null, info: null);
        //Act
        final result = response.toEntity();
        //Assert
        expect(result.message, isNull);
        expect(result.info, isNull);
      },
    );

    test(
      'when call toEntity with non-null values should return ForgetPasswordEntity with right values',
      () {
        //Arrange
        final response = ForgetPasswordResponse(
          message: "message",
          info: "info",
        );
        //Act
        final result = response.toEntity();
        //Assert
        expect(result.message, equals(response.message));
        expect(result.info, equals(response.info));
      },
    );

    test(
      'when call fromDomain with null values should return ForgetPasswordRequest with empty values',
      () {
        //Arrange
        final response = ForgetPasswordRequestEntity(email: null);
        //Act
        final result = response.fromDomain();
        //Assert
        expect(result.email, isNull);
      },
    );

    test(
      'when call fromDomain with non-null values should return ForgetPasswordRequest with right values',
      () {
        //Arrange
        final response = ForgetPasswordRequestEntity(email: "fake-email");
        //Act
        final result = response.fromDomain();
        //Assert
        expect(result.email, equals(response.email));
      },
    );
  });

  group("test ResetPasswordMapper", () {
    test(
      'when call toEntity with null values should return ResetPasswordEntity with empty values',
      () {
        //Arrange
        final response = ResetPasswordResponse(message: null, token: null);
        //Act
        final result = response.toEntity();
        //Assert
        expect(result.message, isNull);
      },
    );

    test(
      'when call toEntity with non-null values should return ResetPasswordEntity with right values',
      () {
        //Arrange
        final response = ResetPasswordResponse(
          message: "message",
          token: "token",
        );
        //Act
        final result = response.toEntity();
        //Assert
        expect(result.message, equals(response.message));
      },
    );

    test(
      'when call fromDomain with null values should return ResetPasswordRequest with empty values',
      () {
        //Arrange
        final response = ResetPasswordRequestEntity(
          email: null,
          newPassword: null,
        );
        //Act
        final result = response.fromDomain();
        //Assert
        expect(result.email, isNull);
        expect(result.newPassword, isNull);
      },
    );

    test(
      'when call fromDomain with non-null values should return ResetPasswordRequest with right values',
      () {
        //Arrange
        final response = ResetPasswordRequestEntity(
          email: "fake-email",
          newPassword: "fake-password",
        );
        //Act
        final result = response.fromDomain();
        //Assert
        expect(result.email, equals(response.email));
        expect(result.newPassword, equals(response.newPassword));
      },
    );
  });

  group("test VerifyResetMapper", () {
    test(
      'when call toEntity with null values should return VerifyResetEntity with empty values',
      () {
        //Arrange
        final response = VerifyResetResponse(status: null);
        //Act
        final result = response.toEntity();
        //Assert
        expect(result.status, isNull);
      },
    );

    test(
      'when call toEntity with non-null values should return VerifyResetEntity with right values',
      () {
        //Arrange
        final response = VerifyResetResponse(status: "status");
        //Act
        final result = response.toEntity();
        //Assert
        expect(result.status, equals(response.status));
      },
    );

    test(
      'when call fromDomain with null values should return VerifyResetRequest with empty values',
          () {
        //Arrange
        final response = VerifyResetRequestEntity(resetCode: null);
        //Act
        final result = response.fromDomain();
        //Assert
        expect(result.resetCode, isNull);
      },
    );

    test(
      'when call fromDomain with non-null values should return VerifyResetRequest with right values',
          () {
        //Arrange
        final response = VerifyResetRequestEntity(resetCode: "fake-reset-code");
        //Act
        final result = response.fromDomain();
        //Assert
        expect(result.resetCode, equals(response.resetCode));
      },
    );
  });
}
