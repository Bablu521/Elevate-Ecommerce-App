import 'package:elevate_ecommerce_app/api/mapper/auth/reset_password_mapper.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/reset_password_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test ResetPasswordMapper", () {
    test(
        'when call fromResponse with null values should return ResetPasswordEntity with empty values', () {
      //Arrange
      final response = ResetPasswordResponse(
          message: null,
          token: null
      );
      //Act
      final result = ResetPasswordMapper.fromResponse(response);
      //Assert
      expect(result.message, isNull);
      expect(result.token, isNull);
    });

    test(
        'when call fromResponse with non-null values should return ResetPasswordEntity with right values', () {
      //Arrange
      final response = ResetPasswordResponse(
        message: "message",
        token: "token",
      );
      //Act
      final result = ResetPasswordMapper.fromResponse(response);
      //Assert
      expect(result.message, equals(response.message));
      expect(result.token, equals(response.token));
    });
  });
}