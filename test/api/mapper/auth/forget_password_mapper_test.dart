import 'package:elevate_ecommerce_app/api/mapper/auth/forget_password_mapper.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/forget_password_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test ForgetPasswordMapper", () {
    test(
        'when call fromResponse with null values should return ForgetPasswordEntity with empty values', () {
      //Arrange
      final response = ForgetPasswordResponse(
        message: null,
        info: null,
      );
      //Act
      final result = ForgetPasswordMapper.fromResponse(response);
      //Assert
      expect(result.message, isNull);
      expect(result.info, isNull);
    });

    test(
        'when call fromResponse with non-null values should return ForgetPasswordEntity with right values', () {
      //Arrange
      final response = ForgetPasswordResponse(
        message: "message",
        info: "info",
      );
      //Act
      final result = ForgetPasswordMapper.fromResponse(response);
      //Assert
      expect(result.message, equals(response.message));
      expect(result.info, equals(response.info));
    });
  });
}