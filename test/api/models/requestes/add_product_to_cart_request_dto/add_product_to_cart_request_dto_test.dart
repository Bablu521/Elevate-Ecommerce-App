import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/add_product_to_cart_request_dto/add_product_to_cart_request_dto.dart';

void main() {
  group('test AddProductToCartRequestDto.fromDomain()', () {
    test(
      'when call fromDomain with null values it should return AddProductToCartRequestDto with null values ',
      () async {
        //Arrange
        final AddProductToCartRequestEntity addProductToCartRequestEntity =
            const AddProductToCartRequestEntity(product: null, quantity: null);

        //Act
        final AddProductToCartRequestDto addProductToCartRequestDto =
            AddProductToCartRequestDto.fromDomain(addProductToCartRequestEntity);

        //Assert
        expect(addProductToCartRequestDto.product, equals(null));
        expect(addProductToCartRequestDto.quantity, equals(null));
      },
    );

    test(
      'when call fromDomain with right values it should return AddProductToCartRequestDto with right values ',
      () async {
        //Arrange
        final AddProductToCartRequestEntity addProductToCartRequestEntity =
            const AddProductToCartRequestEntity(product: "fake-product", quantity: 5);

        //Act
        final AddProductToCartRequestDto addProductToCartRequestDto =
            AddProductToCartRequestDto.fromDomain(
              addProductToCartRequestEntity,
            );

        //Assert
        expect(addProductToCartRequestDto.product, equals(addProductToCartRequestDto.product));
        expect(addProductToCartRequestDto.quantity, equals(addProductToCartRequestDto.quantity));
      },
    );
  });
}
