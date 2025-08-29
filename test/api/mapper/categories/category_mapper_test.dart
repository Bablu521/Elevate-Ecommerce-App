import 'package:elevate_ecommerce_app/api/mapper/categories/category_mapper.dart';
import 'package:elevate_ecommerce_app/api/models/responses/categories/category_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test CategoryMapper", () {
    test(
      'when call fromDTO with null values it should return CategoryEntity with null values',
      () async {
        var categoryDto = CategoryDTO(
          Id: null,
          name: null,
          slug: null,
          image: null,
          createdAt: null,
          updatedAt: null,
          isSuperAdmin: null,
          productsCount: null,
        );

        var result = CategoryMapper.fromDTO(categoryDto);

        expect(result.Id, null);
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
      'when call fromDTO with right values it should return CategoryEntity with right values',
      () {

        var categoryDto = CategoryDTO(
          Id: "fake-id",
          name: "fake-name",
          slug: "fake-slug",
          image: "fake-image",
          createdAt: "fake-created-at",
          updatedAt: "fake-updated-at",
          isSuperAdmin: false,
          productsCount: 0,
        );

        var result = CategoryMapper.fromDTO(categoryDto);

        expect(result.Id, categoryDto.Id);
        expect(result.name, categoryDto.name);
        expect(result.slug, categoryDto.slug);
        expect(result.image, categoryDto.image);
        expect(result.createdAt, categoryDto.createdAt);
        expect(result.updatedAt, categoryDto.updatedAt);
        expect(result.isSuperAdmin, categoryDto.isSuperAdmin);
        expect(result.productsCount, categoryDto.productsCount);
      },
    );
  });
}
