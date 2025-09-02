import 'package:elevate_ecommerce_app/domin/entities/register_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/models/register_dto.dart';

void main() {
  group('test RegisterDto.toRegisterEntity()', () {
    test(
      'when call toRegisterEntity with null values it should return registerEntity with null values',
      () {
        //Arrange
        final RegisterDto registerDto = const RegisterDto(
          firstName: null,
          lastName: null,
          email: null,
          gender: null,
          phone: null,
          photo: null,
          role: null,
          wishlist: null,
          id: null,
          addresses: null,
        );

        //Act
        final RegisterEntity result = registerDto.toRegisterEntity();

        //Assert
        expect(result.firstName, isNull);
        expect(result.lastName, isNull);
        expect(result.email, isNull);
        expect(result.gender, isNull);
        expect(result.phone, isNull);
        expect(result.photo, isNull);
        expect(result.role, isNull);
        expect(result.wishlist, isNull);
        expect(result.id, isNull);
        expect(result.addresses, isNull);
      },
    );

    test(
      'when call toRegisterEntity with non-null values it should return registerEntity with right values',
      () {
        //Arrange
        final RegisterDto registerDto = const RegisterDto(
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

        //Act
        final RegisterEntity result = registerDto.toRegisterEntity();

        //Assert
        expect(result.firstName, equals(registerDto.firstName));
        expect(result.lastName, equals(registerDto.lastName));
        expect(result.email, equals(registerDto.email));
        expect(result.gender, equals(registerDto.gender));
        expect(result.phone, equals(registerDto.phone));
        expect(result.photo, equals(registerDto.photo));
        expect(result.role, equals(registerDto.role));
        expect(result.wishlist, equals(registerDto.wishlist));
        expect(result.id, equals(registerDto.id));
        expect(result.addresses, equals(registerDto.addresses));
      },
    );
  });
}
