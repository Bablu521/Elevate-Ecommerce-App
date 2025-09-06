import 'package:elevate_ecommerce_app/api/models/responses/cart_response_dto/product_dto.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_item_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/models/responses/cart_response_dto/cart_item_dto.dart';

void main() {
  group('test toCartItemEntity', () {
    test(
      'when call toCartItemEntity with null values it should return CartItemEntity with null values',
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
        final CartItemDto cartItemDto = CartItemDto(
          product: productDto,
          price: null,
          quantity: null,
          id: null,
        );

        //Act
        final CartItemEntity result = cartItemDto.toCartItemEntity();

        //Assert
        expect(result.product!.id, equals(null));
        expect(result.product!.title, equals(null));
        expect(result.price, equals(null));
        expect(result.quantity, equals(null));
        expect(result.id, equals(null));
      },
    );

    test(
      'when call toCartItemEntity with right values it should return CartItemEntity with right values',
      () async {
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

        final CartItemDto cartItemDto = CartItemDto(
          product: productDto,
          price: 50,
          quantity: 5,
          id: "fake-id",
        );

        //Act
        final CartItemEntity result = cartItemDto.toCartItemEntity();

        //Assert
        expect(result.product!.id, equals(cartItemDto.product!.id));
        expect(result.product!.title, equals(cartItemDto.product!.title));
        expect(result.price, equals(cartItemDto.price));
        expect(result.quantity, equals(cartItemDto.quantity));
        expect(result.id, equals(cartItemDto.id));
      },
    );
  });
}
