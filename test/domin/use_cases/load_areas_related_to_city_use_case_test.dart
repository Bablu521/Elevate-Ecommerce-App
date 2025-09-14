import 'package:elevate_ecommerce_app/domin/entities/area_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/load_areas_related_to_city_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/domin/repositories/address_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'load_areas_related_to_city_use_case_test.mocks.dart';

@GenerateMocks([AddressRepo])
void main() {
  group('test LoadAreasRelatedToCityUseCase', () {
    late MockAddressRepo mockedAddressRepo;
    late LoadAreasRelatedToCityUseCase loadAreasRelatedToCityUseCase;
    final cityId = 'fake-city-id';
    setUp(() {
      mockedAddressRepo = MockAddressRepo();
      loadAreasRelatedToCityUseCase = LoadAreasRelatedToCityUseCase(mockedAddressRepo);
    });
    test(
      "when call LoadAreasRelatedToCityUseCase it should return list of AreaEntity from repo with correct parameters",
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
          mockedAddressRepo.loadAreasRelatedToCity(cityId),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await loadAreasRelatedToCityUseCase.call(cityId);

        //Assert
        verify(mockedAddressRepo.loadAreasRelatedToCity(cityId)).called(1);
        expect(result, expectedResult);
        expect(result.length, 2);
        expect(result.first.id, "fake-id-1");
        expect(result.last.nameEn, "fake-nameEn-2");
      },
    );

    test(
      "when LoadAreasRelatedToCityUseCase failed it should return return an error result",
      () async {
        //Arrange
        when(
          mockedAddressRepo.loadAreasRelatedToCity(cityId),
        ).thenThrow(Exception("Server Error"));

        // Act + Assert
        expect(() => loadAreasRelatedToCityUseCase.call(cityId), throwsA(isA<Exception>()));
        verify(mockedAddressRepo.loadAreasRelatedToCity(cityId)).called(1);
      },
    );
  });
}
