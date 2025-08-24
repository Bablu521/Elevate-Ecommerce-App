import 'package:elevate_ecommerce_app/api/mapper/auth/verify_reset_mapper.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/verify_reset_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test VerifyResetMapper", () {
    test(
      'when call fromResponse with null values should return VerifyResetEntity with empty values',
      () {
        //Arrange
        final response = VerifyResetResponse(status: null);
        //Act
        final result = VerifyResetMapper.fromResponse(response);
        //Assert
        expect(result.status, isNull);
      },
    );

    test(
      'when call fromResponse with non-null values should return VerifyResetEntity with right values',
      () {
        //Arrange
        final response = VerifyResetResponse(status: "status");
        //Act
        final result = VerifyResetMapper.fromResponse(response);
        //Assert
        expect(result.status, equals(response.status));
      },
    );
  });
}
