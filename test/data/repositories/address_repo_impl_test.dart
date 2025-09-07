import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/address_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/data/repositories/address_repo_impl.dart';
import 'package:elevate_ecommerce_app/data/data_source/address_remote_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'address_repo_impl_test.mocks.dart';

@GenerateMocks([AddressRemoteDataSource])
void main() {
  group('test AddressRepoImpl', () {
    late MockAddressRemoteDataSource mockedAddressRemoteDataSource;
    late AddressRepoImpl addressRepoImpl;
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
    final expectedAddresses = [
      const AddressEntity(
        street: "fake-street-1",
        phone: "fake-phone-1",
        city: "fake-city-1",
        lat: "fake-lat-1",
        long: "fake-long-1",
        username: "fake-username-1",
        id: "fake-id",
      ),
      const AddressEntity(
        street: "fake-street-2",
        phone: "fake-phone-2",
        city: "fake-city-2",
        lat: "fake-lat-2",
        long: "fake-long-2",
        username: "fake-username-2",
        id: "fake-id-2",
      ),
    ];
    final expectedResult = ApiSuccessResult(expectedAddresses);
    final expectedError = "Server Error";
    final expectedFailure = ApiErrorResult<List<AddressEntity>>(expectedError);
    setUp(() {
      mockedAddressRemoteDataSource = MockAddressRemoteDataSource();
      addressRepoImpl = AddressRepoImpl(mockedAddressRemoteDataSource);
    });
    test(
      'when call getLoggedUserAddresses it should return a list of AddressEntity from data source with right parameters',
      () async {
        //Arrange
        provideDummy<ApiResult<List<AddressEntity>>>(expectedResult);
        when(
          mockedAddressRemoteDataSource.getLoggedUserAddresses(),
        ).thenAnswer((_) async => expectedResult);

        //Call
        final result = await addressRepoImpl.getLoggedUserAddresses();

        //Assert
        verify(
          mockedAddressRemoteDataSource.getLoggedUserAddresses(),
        ).called(1);
        expect(result, isA<ApiSuccessResult<List<AddressEntity>>>());
        result as ApiSuccessResult<List<AddressEntity>>;
        expect(result.data, expectedAddresses);
      },
    );

    test(
      'when getLoggedUserAddresses failed it should return an error result',
      () async {
        //Arrange
        provideDummy<ApiResult<List<AddressEntity>>>(expectedFailure);
        when(
          mockedAddressRemoteDataSource.getLoggedUserAddresses(),
        ).thenAnswer((_) async => expectedFailure);

        //Call
        final result = await addressRepoImpl.getLoggedUserAddresses();

        //Assert
        verify(
          mockedAddressRemoteDataSource.getLoggedUserAddresses(),
        ).called(1);
        expect(result, isA<ApiErrorResult<List<AddressEntity>>>());
        result as ApiErrorResult<List<AddressEntity>>;
        expect(result.errorMessage, expectedError);
      },
    );

    test(
      'when call addAddress it should return a list of AddressEntity from data source with right parameters',
      () async {
        //Arrange
        provideDummy<ApiResult<List<AddressEntity>>>(expectedResult);
        when(
          mockedAddressRemoteDataSource.addAddress(addressRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Call
        final result = await addressRepoImpl.addAddress(addressRequestEntity);

        //Assert
        verify(
          mockedAddressRemoteDataSource.addAddress(addressRequestEntity),
        ).called(1);
        expect(result, isA<ApiSuccessResult<List<AddressEntity>>>());
        result as ApiSuccessResult<List<AddressEntity>>;
        expect(result.data, expectedAddresses);
      },
    );

    test('when addAddress failed it should return an error result', () async {
      //Arrange
      provideDummy<ApiResult<List<AddressEntity>>>(expectedFailure);
      when(
        mockedAddressRemoteDataSource.addAddress(addressRequestEntity),
      ).thenAnswer((_) async => expectedFailure);

      //Call
      final result = await addressRepoImpl.addAddress(addressRequestEntity);

      //Assert
      verify(mockedAddressRemoteDataSource.addAddress(addressRequestEntity)).called(1);
      expect(result, isA<ApiErrorResult<List<AddressEntity>>>());
      result as ApiErrorResult<List<AddressEntity>>;
      expect(result.errorMessage, expectedError);
    });

    test(
      'when call updateAddress it should return a list of AddressEntity from data source with right parameters',
      () async {
        //Arrange
        provideDummy<ApiResult<List<AddressEntity>>>(expectedResult);
        when(
          mockedAddressRemoteDataSource.updateAddress(addressRequestEntity, addressId),
        ).thenAnswer((_) async => expectedResult);

        //Call
        final result = await addressRepoImpl.updateAddress(addressRequestEntity, addressId);

        //Assert
        verify(
          mockedAddressRemoteDataSource.updateAddress(addressRequestEntity, addressId),
        ).called(1);
        expect(result, isA<ApiSuccessResult<List<AddressEntity>>>());
        result as ApiSuccessResult<List<AddressEntity>>;
        expect(result.data, expectedAddresses);
      },
    );

    test(
      'when updateAddress failed it should return an error result',
      () async {
        //Arrange
        provideDummy<ApiResult<List<AddressEntity>>>(expectedFailure);
        when(
          mockedAddressRemoteDataSource.updateAddress(addressRequestEntity, addressId),
        ).thenAnswer((_) async => expectedFailure);

        //Call
        final result = await addressRepoImpl.updateAddress(addressRequestEntity, addressId);

        //Assert
        verify(
          mockedAddressRemoteDataSource.updateAddress(addressRequestEntity, addressId),
        ).called(1);
        expect(result, isA<ApiErrorResult<List<AddressEntity>>>());
        result as ApiErrorResult<List<AddressEntity>>;
        expect(result.errorMessage, expectedError);
      },
    );

    test(
      'when call removeAddress it should return a list of AddressEntity from data source with right parameters',
      () async {
        //Arrange
        provideDummy<ApiResult<List<AddressEntity>>>(expectedResult);
        when(
          mockedAddressRemoteDataSource.removeAddress(addressId),
        ).thenAnswer((_) async => expectedResult);

        //Call
        final result = await addressRepoImpl.removeAddress(addressId);

        //Assert
        verify(
          mockedAddressRemoteDataSource.removeAddress(addressId),
        ).called(1);
        expect(result, isA<ApiSuccessResult<List<AddressEntity>>>());
        result as ApiSuccessResult<List<AddressEntity>>;
        expect(result.data, expectedAddresses);
      },
    );

    test(
      'when removeAddress failed it should return an error result',
      () async {
        //Arrange
        provideDummy<ApiResult<List<AddressEntity>>>(expectedFailure);
        when(
          mockedAddressRemoteDataSource.removeAddress(addressId),
        ).thenAnswer((_) async => expectedFailure);

        //Call
        final result = await addressRepoImpl.removeAddress(addressId);

        //Assert
        verify(
          mockedAddressRemoteDataSource.removeAddress(addressId),
        ).called(1);
        expect(result, isA<ApiErrorResult<List<AddressEntity>>>());
        result as ApiErrorResult<List<AddressEntity>>;
        expect(result.errorMessage, expectedError);
      },
    );
  });
}
