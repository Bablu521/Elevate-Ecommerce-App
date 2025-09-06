import 'package:elevate_ecommerce_app/api/models/responses/cart_response_dto/cart_item_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/cart_response_dto/product_dto.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/models/responses/cart_response_dto/cart_dto.dart';

void main() {
  group('test toCartEntity', () {
    test(
      'when call toCartEntity with null values it should return CartEntity with null values',
      () async {
        //Arrange
        final CartDto cartDto = const CartDto(
          id: null,
          user: null,
          cartItems: null,
          appliedCoupons: null,
          totalPrice: null,
          createdAt: null,
          updatedAt: null,
          v: null
        );

        //Act
        final CartEntity result = cartDto.toCartEntity();

        //Assert
        expect(result.id, equals(null));
        expect(result.user, equals(null));
        expect(result.cartItems, equals(null));
        expect(result.appliedCoupons, equals(null));
        expect(result.totalPrice, equals(null));
        expect(result.createdAt, equals(null));
        expect(result.updatedAt, equals(null));
        expect(result.v, equals(null));
      },
    );

    test(
      'when call toCartEntity with right values it should return CartEntity with right values',
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
        final CartDto cartDto = CartDto(
          id: "fake-id",
          user: "fake-user",
          cartItems: [cartItemDto],
          appliedCoupons: ["fake-coupon"],
          totalPrice: 5,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          v: 5,
        );

        //Act
        final CartEntity result = cartDto.toCartEntity();

        //Assert
        expect(result.id, equals(cartDto.id));
        expect(result.user, equals(cartDto.user));
        expect(result.cartItems!.length, equals(cartDto.cartItems!.length));
        expect(result.cartItems![0].id, equals(cartDto.cartItems![0].id));
        expect(result.cartItems![0].product!.id, equals(cartDto.cartItems![0].product!.id));
        expect(
          result.cartItems![0].product!.title,
          equals(cartDto.cartItems![0].product!.title),
        );
        expect(result.appliedCoupons, equals(cartDto.appliedCoupons));
        expect(result.totalPrice, equals(cartDto.totalPrice));
        expect(result.createdAt, equals(cartDto.createdAt));
        expect(result.updatedAt, equals(cartDto.updatedAt));
        expect(result.v, equals(cartDto.v));
      },
    );
  });
}
