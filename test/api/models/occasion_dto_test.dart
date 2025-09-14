import 'package:elevate_ecommerce_app/domin/entities/occasion_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/models/occasion_dto.dart';

void main() {
  group('test OccasionDto.toOccasOccasionEntity()', () {
    test(
      'when call toOccasOccasionEntity with null values it should return OccasionEntity with null values',
      () async {
        //Arrange
        final OccasionDto occasionDto = const OccasionDto(
          id: null,
          name: null,
          slug: null,
          image: null,
          createdAt: null,
          updatedAt: null,
          isSuperAdmin: null,
          productsCount: null,
        );

        //Act
        final OccasionEntity result = occasionDto.toOccasOccasionEntity();

        //Assert
        expect(result.id, null);
        expect(result.name, null);
        expect(result.slug, null);
        expect(result.image, null);
        expect(result.createdAt, null);
        expect(result.updatedAt, null);
        expect(result.isSuperAdmin, null);
        expect(result.productsCount, null);
      },
    );

    test(
      'when call toOccasOccasionEntity with right values it should return OccasionEntity with right values',
      () {
        //Arrange
        final OccasionDto occasionDto = OccasionDto(
          id: "fake-id",
          name: "fake-name",
          slug: "fake-slug",
          image: "fake-image",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          isSuperAdmin: false,
          productsCount: 0,
        );

        //Act
        final OccasionEntity result = occasionDto.toOccasOccasionEntity();

        //Assert
        expect(result.id, occasionDto.id);
        expect(result.name, occasionDto.name);
        expect(result.slug, occasionDto.slug);
        expect(result.image, occasionDto.image);
        expect(result.createdAt, occasionDto.createdAt);
        expect(result.updatedAt, occasionDto.updatedAt);
        expect(result.isSuperAdmin, occasionDto.isSuperAdmin);
        expect(result.productsCount, occasionDto.productsCount);
      },
    );
  });
}
