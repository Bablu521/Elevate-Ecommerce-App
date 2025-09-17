import 'package:elevate_ecommerce_app/domin/entities/city_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/load_all_cities_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/domin/repositories/address_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'load_all_cities_use_case_test.mocks.dart';

@GenerateMocks([AddressRepo])
void main() {
  group('test LoadAllCitiesUseCase', () {
    late MockAddressRepo mockedAddressRepo;
    late LoadAllCitiesUseCase loadAllCitiesUseCase;
    setUp(() {
      mockedAddressRepo = MockAddressRepo();
      loadAllCitiesUseCase = LoadAllCitiesUseCase(mockedAddressRepo);
    });
    test(
      "when call LoadAllCitiesUseCase it should return list of CityEntity from repo with correct parameters",
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
          mockedAddressRepo.loadAllCities(),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await loadAllCitiesUseCase.call();

        //Assert
        verify(mockedAddressRepo.loadAllCities()).called(1);
        expect(result, expectedResult);
        expect(result.length, 2);
        expect(result.first.id, "fake-id-1");
        expect(result.last.nameEn, "fake-nameEn-2");
      },
    );

    test(
      "when LoadAllCitiesUseCase failed it should return return an error result",
      () async {
        //Arrange
        when(mockedAddressRepo.loadAllCities()).thenThrow(Exception("Server Error"));

         // Act + Assert
        expect(() => loadAllCitiesUseCase.call(), throwsA(isA<Exception>()));
        verify(mockedAddressRepo.loadAllCities()).called(1);

        
      },
    );
  });
}
