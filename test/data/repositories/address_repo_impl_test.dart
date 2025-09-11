import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/area_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/city_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/address_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/data/repositories/address_repo_impl.dart';
import 'package:elevate_ecommerce_app/data/data_source/address_remote_data_source.dart';
import 'package:elevate_ecommerce_app/data/data_source/address_local_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'address_repo_impl_test.mocks.dart';

@GenerateMocks([AddressRemoteDataSource, AddressLocalDataSource])
void main() {
  group('test AddressRepoImpl', () {
    late MockAddressRemoteDataSource mockedAddressRemoteDataSource;
    late MockAddressLocalDataSource mockedAddressLocalDataSource;
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
    final cityId = "fake-city-id-1";
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
      mockedAddressLocalDataSource = MockAddressLocalDataSource();
      addressRepoImpl = AddressRepoImpl(
        mockedAddressRemoteDataSource,
        mockedAddressLocalDataSource,
      );
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
      verify(
        mockedAddressRemoteDataSource.addAddress(addressRequestEntity),
      ).called(1);
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
          mockedAddressRemoteDataSource.updateAddress(
            addressRequestEntity,
            addressId,
          ),
        ).thenAnswer((_) async => expectedResult);

        //Call
        final result = await addressRepoImpl.updateAddress(
          addressRequestEntity,
          addressId,
        );

        //Assert
        verify(
          mockedAddressRemoteDataSource.updateAddress(
            addressRequestEntity,
            addressId,
          ),
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
          mockedAddressRemoteDataSource.updateAddress(
            addressRequestEntity,
            addressId,
          ),
        ).thenAnswer((_) async => expectedFailure);

        //Call
        final result = await addressRepoImpl.updateAddress(
          addressRequestEntity,
          addressId,
        );

        //Assert
        verify(
          mockedAddressRemoteDataSource.updateAddress(
            addressRequestEntity,
            addressId,
          ),
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

    test(
      "when call loadAllCities it should return a list of cityEntity from local data source with right parameters",
      () async {
        //Arrange
        final expectedResult = [
          const CityEntity(
            id: "fake-id-1",
            nameEn: "fake-nameEn-1",
            nameAr: "fake-nameAr-1",
          ),
          const CityEntity(
            id: "fake-id-2",
            nameEn: "fake-nameEn-2",
            nameAr: "fake-nameAr-2",
          ),
        ];
        when(
          mockedAddressLocalDataSource.loadAllCities(),
        ).thenAnswer((_) async => expectedResult);

        //Call
        final result = await addressRepoImpl.loadAllCities();

        //Assert
        verify(mockedAddressLocalDataSource.loadAllCities()).called(1);
        expect(result, expectedResult);
        expect(result.length, 2);
        expect(result.first.id, "fake-id-1");
        expect(result.last.nameEn, "fake-nameEn-2");
      },
    );

    test(
      "when loadAllCities failed it should return return an error result",
      () async {
        //Arrange
        when(
          mockedAddressLocalDataSource.loadAllCities(),
        ).thenThrow(Exception("Server Error"));

        // Act + Assert
        expect(
          () => addressRepoImpl.loadAllCities(),
          throwsA(isA<Exception>()),
        );
        verify(mockedAddressLocalDataSource.loadAllCities()).called(1);
      },
    );

    test(
      "when call loadAreasRelatedToCity it should return a list of areaEntity from local data source with right parameters",
      () async {
        //Arrange
        final expectedResult = [
          const AreaEntity(
            id: "fake-id-1",
            cityId: "fake-city-id-1",
            nameEn: "fake-nameEn-1",
            nameAr: "fake-nameAr-1",
          ),
          const AreaEntity(
            id: "fake-id-2",
            cityId: "fake-city-id-2",
            nameEn: "fake-nameEn-2",
            nameAr: "fake-nameAr-2",
          ),
        ];
        when(
          mockedAddressLocalDataSource.loadAllAreas(),
        ).thenAnswer((_) async => expectedResult);
        
        //Call
        final result = await addressRepoImpl.loadAreasRelatedToCity(cityId);
        
        //Assert
        verify(mockedAddressLocalDataSource.loadAllAreas()).called(1);
        expect(result.length, 1);
        expect(result, [
          const AreaEntity(
            id: "fake-id-1",
            cityId: "fake-city-id-1",
            nameEn: "fake-nameEn-1",
            nameAr: "fake-nameAr-1",
          ),
        ]);
      },
    );

    test(
      "when loadAreasRelatedToCity failed it should return return an error result",
      () async {
        //Arrange
        when(
          mockedAddressLocalDataSource.loadAllAreas(),
        ).thenThrow(Exception("Server Error"));

        // Act + Assert
        expect(
          () => addressRepoImpl.loadAreasRelatedToCity(cityId),
          throwsA(isA<Exception>()),
        );
        verify(mockedAddressLocalDataSource.loadAllAreas()).called(1);
      },
    );
  });
}
