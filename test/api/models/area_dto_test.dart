import 'package:elevate_ecommerce_app/domin/entities/area_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/models/area_dto.dart';

void main() {
  group('test AreaDto', () {
    test(
      'when call toEntity with null values it should return areaEntity with null values',
      () async {
        //Arrange
        final AreaDto areaDto = const AreaDto(
          id: null,
          cityId: null,
          nameEn: null,
          nameAr: null,
        );

        //Act
        final AreaEntity result = areaDto.toEntity();

        //Assert
        expect(result.id, isNull);
        expect(result.cityId, isNull);
        expect(result.nameEn, isNull);
        expect(result.nameAr, isNull);
      },
    );

    test(
      'when call toEntity with non-null values it should return areaEntity with right values',
      () async {
        //Arrange
        final AreaDto areaDto = const AreaDto(
          id: "fake-id",
          cityId: "fake-cityId",
          nameEn: "fake-nameEn",
          nameAr: "fake-nameAr",
        );

        //Act
        final AreaEntity result = areaDto.toEntity();

        //Assert
        expect(result.id, equals(areaDto.id));
        expect(result.cityId, equals(areaDto.cityId));
        expect(result.nameEn, equals(areaDto.nameEn));
        expect(result.nameAr, equals(areaDto.nameAr));
      },
    );

    test(
      'when call AreaDto.fromJson should parse JSON correctly with all fields',
      () async {
        //Arrange
        final json = {
          'id': "fake-id",
          'governorate_id': "fake-cityId",
          'city_name_en': "fake-nameEn",
          'city_name_ar': "fake-nameAr",
        };

        //Act
        final result = AreaDto.fromJson(json);

        //Assert
        expect(result.id, json["id"]);
        expect(result.cityId, json["governorate_id"]);
        expect(result.nameEn, json["city_name_en"]);
        expect(result.nameAr, json["city_name_ar"]);
      },
    );

    test(
      'when call AreaDto.fromJson should handle missing optional fields',
      () {
        //Arrange
        final json = {'id': "fake-id", 'governorate_id': "fake-cityId"};

        //Act
        final result = AreaDto.fromJson(json);

        //Assert
        expect(result.id, json["id"]);
        expect(result.cityId, json["governorate_id"]);
        expect(result.nameEn, '');
        expect(result.nameAr, '');
      },
    );
  });
}
