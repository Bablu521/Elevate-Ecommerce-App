import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/models/product_dto.dart';

void main() {
  group('test ProductDto.toProductEntity()', () {
    test(
      'when call toProductEntity with null values it should return ProductEntity with null values',
      () async {
        //Arrange
        final ProductDto productDto = const ProductDto(
          rateAvg: null,
          rateCount: null,
          id: null,
          title: null,
          slug: null,
          description: null,
          imgCover: null,
          images: null,
          price: null,
          priceAfterDiscount: null,
          quantity: null,
          category: null,
          occasion: null,
          createdAt: null,
          updatedAt: null,
          v: null,
          isSuperAdmin: null,
          sold: null,
        );

        //Act
        final ProductEntity result = productDto.toProductEntity();

        //Assert
        expect(result.rateAvg, equals(null));
        expect(result.rateCount, equals(null));
        expect(result.id, equals(null));
        expect(result.title, equals(null));
        expect(result.slug, equals(null));
        expect(result.description, equals(null));
        expect(result.imgCover, equals(null));
        expect(result.images, equals(null));
        expect(result.price, equals(null));
        expect(result.priceAfterDiscount, equals(null));
        expect(result.quantity, equals(null));
        expect(result.category, equals(null));
        expect(result.occasion, equals(null));
        expect(result.createdAt, equals(null));
        expect(result.updatedAt, equals(null));
        expect(result.v, equals(null));
        expect(result.isSuperAdmin, equals(null));
        expect(result.sold, equals(null));
      },
    );

    test(
      'when call toProductEntity with right values it should return ProductEntity with right values',
      () {
        //Arrange
        final ProductDto productDto = ProductDto(
          rateAvg: 5,
          rateCount: 10,
          id: "fake-id",
          title: "fake-title",
          slug: "fake-slug",
          description: "fake-description",
          imgCover: "fake-imgCover",
          images: ["fake-image1", "fake-image2"],
          price: 100,
          priceAfterDiscount: 80,
          quantity: 50,
          category: "fake-category",
          occasion: "fake-occasion",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          v: 1,
          isSuperAdmin: false,
          sold: 20,
        );

        //Act
        final ProductEntity result = productDto.toProductEntity();

        //Assert
        expect(result.rateAvg, equals(productDto.rateAvg));
        expect(result.rateCount, equals(productDto.rateCount));
        expect(result.id, equals(productDto.id));
        expect(result.title, equals(productDto.title));
        expect(result.slug, equals(productDto.slug));
        expect(result.description, equals(productDto.description));
        expect(result.imgCover, equals(productDto.imgCover));
        expect(result.images, equals(productDto.images));
        expect(result.price, equals(productDto.price));
        expect(result.priceAfterDiscount, equals(productDto.priceAfterDiscount));
        expect(result.quantity, equals(productDto.quantity));
        expect(result.category, equals(productDto.category));
        expect(result.occasion, equals(productDto.occasion));
        expect(result.createdAt, equals(productDto.createdAt));
        expect(result.updatedAt, equals(productDto.updatedAt));
        expect(result.v, equals(productDto.v));
        expect(result.isSuperAdmin, equals(productDto.isSuperAdmin));
        expect(result.sold, equals(productDto.sold));
      },
    );
  });
}
