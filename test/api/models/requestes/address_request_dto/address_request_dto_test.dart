import 'package:elevate_ecommerce_app/domin/entities/requests/address_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/address_request_dto/address_request_dto.dart';

void main() {
  group('test AddressRequestDto.fromDomain', () {
    test(
      'when call fromDomain with null values it should return AddressRequestDto with null values',
      () async {
        //Arrange
        final AddressRequestEntity addressRequestEntity =
            const AddressRequestEntity(
              street: null,
              phone: null,
              city: null,
              lat: null,
              long: null,
              username: null,
            );

        //Act
        final AddressRequestDto result = AddressRequestDto.fromDomain(
          addressRequestEntity,
        );

        //Assert
        expect(result.street, isNull);
        expect(result.phone, isNull);
        expect(result.city, isNull);
        expect(result.lat, isNull);
        expect(result.long, isNull);
        expect(result.username, isNull);
      },
    );

    test(
      'when call fromDomain with non-null values it should return AddressRequestDto with right values',
      () async {
        //Arrange
        final AddressRequestEntity addressRequestEntity =
            const AddressRequestEntity(
              street: "fake-street",
              phone: "fake-phone",
              city: "fake-city",
              lat: "fake-lat",
              long: "fake-long",
              username: "fake-username",
            );

        //Act
        final AddressRequestDto result = AddressRequestDto.fromDomain(
          addressRequestEntity,
        );

        //Assert
        expect(result.street, equals(addressRequestEntity.street));
        expect(result.phone, equals(addressRequestEntity.phone));
        expect(result.city, equals(addressRequestEntity.city));
        expect(result.lat, equals(addressRequestEntity.lat));
        expect(result.long, equals(addressRequestEntity.long));
        expect(result.username, equals(addressRequestEntity.username));
        
      },
    );
  });
}
