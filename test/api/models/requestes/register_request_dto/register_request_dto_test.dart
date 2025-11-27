import 'package:elevate_ecommerce_app/domin/entities/requests/register_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/register_request_dto/register_request_dto.dart';

void main() {
  group('test RegisterRequestDto.fromDomain()', () {
    test(
      'when call fromDomain with null values it should return RegisterRequestDto with null values ',
      () {
        //Arrange
        final RegisterRequestEntity registerRequestEntity =
            const RegisterRequestEntity(
              firstName: null,
              lastName: null,
              email: null,
              password: null,
              rePassword: null,
              phone: null,
              gender: null,
            );

        //Act
        final RegisterRequestDto result = RegisterRequestDto.fromDomain(
          registerRequestEntity,
        );

        //Assert
        expect(result.firstName, isNull);
        expect(result.lastName, isNull);
        expect(result.email, isNull);
        expect(result.password, isNull);
        expect(result.rePassword, isNull);
        expect(result.phone, isNull);
        expect(result.gender, isNull);
      },
    );

    test(
      'when call fromDomain with non-null values it should return RegisterRequestDto with right values ',
      () {
        //Arrange
        final RegisterRequestEntity registerRequestEntity =
            const RegisterRequestEntity(
              firstName: "fake-firstName",
              lastName: "fake-lastName",
              email: "fake-email",
              password: "fake-password",
              rePassword: "fake-rePassword",
              phone: "fake-phone",
              gender: "fake-gender",
            );

        //Act
        final RegisterRequestDto result = RegisterRequestDto.fromDomain(
          registerRequestEntity,
        );

        //Assert
        expect(result.firstName, equals(registerRequestEntity.firstName));
        expect(result.lastName, equals(registerRequestEntity.lastName));
        expect(result.email, equals(registerRequestEntity.email));
        expect(result.password, equals(registerRequestEntity.password));
        expect(result.rePassword, equals(registerRequestEntity.rePassword));
        expect(result.phone, equals(registerRequestEntity.phone));
        expect(result.gender, equals(registerRequestEntity.gender));
      },
    );
  });
}
