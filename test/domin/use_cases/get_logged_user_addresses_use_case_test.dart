import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_logged_user_addresses_use_case.dart';
import 'package:elevate_ecommerce_app/domin/repositories/address_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_logged_user_addresses_use_case_test.mocks.dart';

@GenerateMocks([AddressRepo])
void main() {
  group('test GetLoggedUserAddressesUseCase', () {
    late MockAddressRepo mockedAddressRepo;
    late GetLoggedUserAddressesUseCase getLoggedUserAddressesUseCase;
    setUp(() {
      mockedAddressRepo = MockAddressRepo();
      getLoggedUserAddressesUseCase = GetLoggedUserAddressesUseCase(
        mockedAddressRepo,
      );
    });
    test(
      'when call GetLoggedUserAddressesUseCase it should return list of AddressEntity from repo with correct parameters',
      () async {
        //Arrange
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
        provideDummy<ApiResult<List<AddressEntity>>>(expectedResult);
        when(
          mockedAddressRepo.getLoggedUserAddresses(),
        ).thenAnswer((_) async => expectedResult);

        //Call
        final result = await getLoggedUserAddressesUseCase.call();

        //Assert
        verify(mockedAddressRepo.getLoggedUserAddresses()).called(1);
        expect(result, isA<ApiSuccessResult<List<AddressEntity>>>());
        result as ApiSuccessResult<List<AddressEntity>>;
        expect(result.data, expectedAddresses);
      },
    );

    test(
      'when GetLoggedUserAddressesUseCase failed it should return return an error result',
      () async {
        //Arrange
        final expectedError = "Server Error";
        final expectedFailure = ApiErrorResult<List<AddressEntity>>(expectedError);
        provideDummy<ApiResult<List<AddressEntity>>>(expectedFailure);
        when(
          mockedAddressRepo.getLoggedUserAddresses(),
        ).thenAnswer((_) async => expectedFailure);

        //Call
        final result = await getLoggedUserAddressesUseCase.call();

        //Assert
        verify(mockedAddressRepo.getLoggedUserAddresses()).called(1);
        expect(result, isA<ApiErrorResult<List<AddressEntity>>>());
        result as ApiErrorResult<List<AddressEntity>>;
        expect(result.errorMessage, expectedError);
      },
    );
  });
}
