import 'package:elevate_ecommerce_app/api/models/requestes/address_request_dto/address_request_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/addresses_response_dto/address_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/addresses_response_dto/addresses_response_dto.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/address_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/data_source/address_remote_data_source_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'address_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  group('test AddressRemoteDataSourceImpl', () {
    late MockApiClient mockedApiClient;
    late AddressRemoteDataSourceImpl addressRemoteDataSourceImpl;
    final AddressRequestEntity addressRequestEntity =
        const AddressRequestEntity(
          street: "fake-street",
          phone: "fake-phone",
          city: "fake-city",
          lat: "fake-lat",
          long: "fake-long",
          username: "fake-username",
        );
    final addressId = 'fake-id';
    const expectedAddresses = [
      AddressDto(
        street: "fake-street-1",
        phone: "fake-phone-1",
        city: "fake-city-1",
        lat: "fake-lat-1",
        long: "fake-long-1",
        username: "fake-username-1",
        id: "fake-id",
      ),
      AddressDto(
        street: "fake-street-2",
        phone: "fake-phone-2",
        city: "fake-city-2",
        lat: "fake-lat-2",
        long: "fake-long-2",
        username: "fake-username-2",
        id: "fake-id-2",
      ),
    ];
    final expectedResult = const AddressesResponseDto(
      message: "fake-message",
      address: expectedAddresses,
    );
    final expectedError = "Server Error";
    setUp(() {
      mockedApiClient = MockApiClient();
      addressRemoteDataSourceImpl = AddressRemoteDataSourceImpl(
        mockedApiClient,
      );
    });
    test(
      'when call getLoggedUserAddresses it should return a list of AddressDto from api with right parameters',
      () async {
        //Arrange
        when(
          mockedApiClient.getLoggedUserAddresses(),
        ).thenAnswer((_) async => expectedResult);

        //Call
        final result = await addressRemoteDataSourceImpl
            .getLoggedUserAddresses();

        //Assert
        verify(mockedApiClient.getLoggedUserAddresses()).called(1);
        expect(result, isA<ApiSuccessResult<List<AddressEntity>>>());
        result as ApiSuccessResult<List<AddressEntity>>;
        expect(
          result.data,
          expectedResult.address!.map((item) => item.toAddressEntity()).toList(),
        );
        expect(
          result.data.length,
          expectedResult.address!.length
        );
      },
    );

    test(
      'when getLoggedUserAddresses failed it should return an error result',
      () async {
        //Arrange
        when(
          mockedApiClient.getLoggedUserAddresses(),
        ).thenThrow(Exception(expectedError));

        //Call
        final result = await addressRemoteDataSourceImpl
            .getLoggedUserAddresses();

        //Assert
        verify(mockedApiClient.getLoggedUserAddresses()).called(1);
        expect(result, isA<ApiErrorResult<List<AddressEntity>>>());
        result as ApiErrorResult<List<AddressEntity>>;
        expect(
          result.errorMessage,
          contains(expectedError)
        );
      },
    );

    test(
      'when call addAddress it should return a list of AddressDto from api with right parameters',
      () async {
        //Arrange
        when(
          mockedApiClient.addAddress(AddressRequestDto.fromDomain(addressRequestEntity)),
        ).thenAnswer((_) async => expectedResult);

        //Call
        final result = await addressRemoteDataSourceImpl
            .addAddress(addressRequestEntity);

        //Assert
        verify(mockedApiClient.addAddress(AddressRequestDto.fromDomain(addressRequestEntity))).called(1);
        expect(result, isA<ApiSuccessResult<List<AddressEntity>>>());
        result as ApiSuccessResult<List<AddressEntity>>;
        expect(
          result.data,
          expectedResult.address!
              .map((item) => item.toAddressEntity())
              .toList(),
        );
        expect(result.data.length, expectedResult.address!.length);
      },
    );

    test(
      'when addAddress failed it should return an error result',
      () async {
        //Arrange
        when(
          mockedApiClient.addAddress(AddressRequestDto.fromDomain(addressRequestEntity)),
        ).thenThrow(Exception(expectedError));

        //Call
        final result = await addressRemoteDataSourceImpl
            .addAddress(addressRequestEntity);

        //Assert
        verify(mockedApiClient.addAddress(AddressRequestDto.fromDomain(addressRequestEntity))).called(1);
        expect(result, isA<ApiErrorResult<List<AddressEntity>>>());
        result as ApiErrorResult<List<AddressEntity>>;
        expect(result.errorMessage, contains(expectedError));
      },
    );

    test(
      'when call updateAddress it should return a list of AddressDto from api with right parameters',
      () async {
        //Arrange
        when(
          mockedApiClient.updateAddress(AddressRequestDto.fromDomain(addressRequestEntity), addressId),
        ).thenAnswer((_) async => expectedResult);

        //Call
        final result = await addressRemoteDataSourceImpl
            .updateAddress(addressRequestEntity, addressId);

        //Assert
        verify(mockedApiClient.updateAddress(AddressRequestDto.fromDomain(addressRequestEntity), addressId)).called(1);
        expect(result, isA<ApiSuccessResult<List<AddressEntity>>>());
        result as ApiSuccessResult<List<AddressEntity>>;
        expect(
          result.data,
          expectedResult.address!
              .map((item) => item.toAddressEntity())
              .toList(),
        );
        expect(result.data.length, expectedResult.address!.length);
      },
    );

    test(
      'when updateAddress failed it should return an error result',
      () async {
        //Arrange
        when(
          mockedApiClient.updateAddress(AddressRequestDto.fromDomain(addressRequestEntity), addressId),
        ).thenThrow(Exception(expectedError));

        //Call
        final result = await addressRemoteDataSourceImpl
            .updateAddress(addressRequestEntity, addressId);

        //Assert
        verify(mockedApiClient.updateAddress(AddressRequestDto.fromDomain(addressRequestEntity), addressId)).called(1);
        expect(result, isA<ApiErrorResult<List<AddressEntity>>>());
        result as ApiErrorResult<List<AddressEntity>>;
        expect(result.errorMessage, contains(expectedError));
      },
    );

    test(
      'when call removeAddress it should return a list of AddressDto from api with right parameters',
      () async {
        //Arrange
        when(
          mockedApiClient.removeAddress(addressId),
        ).thenAnswer((_) async => expectedResult);

        //Call
        final result = await addressRemoteDataSourceImpl
            .removeAddress(addressId);

        //Assert
        verify(mockedApiClient.removeAddress(addressId)).called(1);
        expect(result, isA<ApiSuccessResult<List<AddressEntity>>>());
        result as ApiSuccessResult<List<AddressEntity>>;
        expect(
          result.data,
          expectedResult.address!
              .map((item) => item.toAddressEntity())
              .toList(),
        );
        expect(result.data.length, expectedResult.address!.length);
      },
    );

    test(
      'when removeAddress failed it should return an error result',
      () async {
        //Arrange
        when(
          mockedApiClient.removeAddress(addressId),
        ).thenThrow(Exception(expectedError));

        //Call
        final result = await addressRemoteDataSourceImpl
            .removeAddress(addressId);

        //Assert
        verify(mockedApiClient.removeAddress(addressId)).called(1);
        expect(result, isA<ApiErrorResult<List<AddressEntity>>>());
        result as ApiErrorResult<List<AddressEntity>>;
        expect(result.errorMessage, contains(expectedError));
      },
    );

  });
}
