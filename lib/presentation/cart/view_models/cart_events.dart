import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';

sealed class CartEvents {}

class OnLoadLoggedUserCartDataEvent extends CartEvents {}

class OnDeleteSpecificCartItemEvent extends CartEvents {
  final String productId;

  OnDeleteSpecificCartItemEvent({required this.productId});
}

class OnIncrementProductToCartEvent extends CartEvents {
  final AddProductToCartRequestEntity addProductToCartRequestEntity;

  OnIncrementProductToCartEvent({required this.addProductToCartRequestEntity});
}

class OnDecrementProductFromCartEvent extends CartEvents {
  final AddProductToCartRequestEntity addProductToCartRequestEntity;

  OnDecrementProductFromCartEvent({required this.addProductToCartRequestEntity});
}

class OnClearUserCartEvent extends CartEvents {}
