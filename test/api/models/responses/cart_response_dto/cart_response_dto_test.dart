import 'package:elevate_ecommerce_app/api/models/responses/cart_response_dto/cart_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/cart_response_dto/cart_item_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/cart_response_dto/product_dto.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/models/responses/cart_response_dto/cart_response_dto.dart';

void main() {
  group('test toCartResponseEntity', () {
    test(
      'when call toCartResponseEntity with null values it should return CartResponseEntity with null values',
      () async {
        //Arrange
        final CartResponseDto cartResponseDto = const CartResponseDto(
          message: null,
          numOfCartItems: null,
          cart: null
        );

        //Act
        final CartResponseEntity result = cartResponseDto.toCartResponseEntity();

        //Assert
        expect(result.message, equals(null));
        expect(result.numOfCartItems, equals(null));
        expect(result.cart, equals(null));
      },
    );

    test(
      'when call toCartResponseEntity with right values it should return CartResponseEntity with right values',
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
        final CartResponseDto cartResponseDto = CartResponseDto(
          message: "fake-message",
          numOfCartItems: 5,
          cart: cartDto,
        );

        //Act
        final CartResponseEntity result = cartResponseDto
            .toCartResponseEntity();

        //Assert
        expect(result.message, equals(cartResponseDto.message));
        expect(result.numOfCartItems, equals(cartResponseDto.numOfCartItems));
        expect(result.cart!.id, equals(cartResponseDto.cart!.id));
        expect(result.cart!.cartItems!.length, equals(cartResponseDto.cart!.cartItems!.length));
        expect(
          result.cart!.cartItems![0].id,
          equals(cartResponseDto.cart!.cartItems![0].id),
        );
        expect(
          result.cart!.cartItems![0].product!.id,
          equals(cartResponseDto.cart!.cartItems![0].product!.id),
        );
        expect(
          result.cart!.cartItems![0].product!.title,
          equals(cartResponseDto.cart!.cartItems![0].product!.title),
        );
      },
    );
  });
}
