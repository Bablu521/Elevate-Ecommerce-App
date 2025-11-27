import 'package:elevate_ecommerce_app/domin/entities/city_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/models/city_dto.dart';

void main() {
  group('test CityDto', () {
    test(
      'when call toEntity with null values it should return 3Entity with null values',
      () async {
        //Arrange
        final CityDto cityDto = const CityDto(
          id: null,
          nameEn: null,
          nameAr: null,
        );

        //Act
        final CityEntity result = cityDto.toEntity();

        //Assert
        expect(result.id, isNull);
        expect(result.nameEn, isNull);
        expect(result.nameAr, isNull);
      },
    );

    test(
      'when call toEntity with non-null values it should return cityEntity with right values',
      () async {
        //Arrange
        final CityDto cityDto = const CityDto(
          id: "fake-id",
          nameEn: "fake-nameEn",
          nameAr: "fake-nameAr",
        );

        //Act
        final CityEntity result = cityDto.toEntity();

        //Assert
        expect(result.id, equals(cityDto.id));
        expect(result.nameEn, equals(cityDto.nameEn));
        expect(result.nameAr, equals(cityDto.nameAr));
      },
    );

    test(
      'when call CityDto.fromJson should parse JSON correctly with all fields',
      () async {
        //Arrange
        final json = {
          'id': "fake-id",
          'governorate_name_en': "fake-nameEn",
          'governorate_name_ar': "fake-nameAr",
        };

        //Act
        final result = CityDto.fromJson(json);

        //Assert
        expect(result.id, json["id"]);
        expect(result.nameEn, json["governorate_name_en"]);
        expect(result.nameAr, json["governorate_name_ar"]);
      },
    );

    test(
      'when call CityDto.fromJson should handle missing optional fields',
      () {
        //Arrange
        final json = {'id': "fake-id"};

        //Act
        final result = CityDto.fromJson(json);

        //Assert
        expect(result.id, json["id"]);
        expect(result.nameEn, '');
        expect(result.nameAr, '');
      },
    );
  });
}
