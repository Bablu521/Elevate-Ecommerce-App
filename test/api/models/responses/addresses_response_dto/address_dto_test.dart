import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/models/responses/addresses_response_dto/address_dto.dart';

void main() {
  group('test AddressDto.toAddressEntity()', () {
    test(
      'when call toAddressEntity with null values it should return addressEntity with null values',
      () async {
        //Arrange
        final AddressDto addressDto = const AddressDto(
          street: null,
          phone: null,
          city: null,
          lat: null,
          long: null,
          username: null,
          id: null,
        );

        //Act
        final AddressEntity result = addressDto.toAddressEntity();

        //Assert
        expect(result.street, isNull);
        expect(result.phone, isNull);
        expect(result.city, isNull);
        expect(result.lat, isNull);
        expect(result.long, isNull);
        expect(result.username, isNull);
        expect(result.id, isNull);
      },
    );

    test(
      'when call toAddressEntity with non-null values it should return addressEntity with right values',
      () async {
        //Arrange
        final AddressDto addressDto = const AddressDto(
          street: "fake-street",
          phone: "fake-phone",
          city: "fake-city",
          lat: "fake-lat",
          long: "fake-long",
          username: "fake-username",
          id: "fake-id",
        );

        //Act
        final AddressEntity result = addressDto.toAddressEntity();

        //Assert
        expect(result.street, equals(addressDto.street));
        expect(result.phone, equals(addressDto.phone));
        expect(result.city, equals(addressDto.city));
        expect(result.lat, equals(addressDto.lat));
        expect(result.long, equals(addressDto.long));
        expect(result.username, equals(addressDto.username));
        expect(result.id, equals(addressDto.id));
      },
    );
  });
}


