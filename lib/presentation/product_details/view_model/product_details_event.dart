import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';

sealed class ProductDetailsEvent {}

class ProductDetailsAddToCartEvent extends ProductDetailsEvent {
  final AddProductToCartRequestEntity request;

  ProductDetailsAddToCartEvent({required this.request});
}

class ProductDetailsUpdateImageCover extends ProductDetailsEvent {
  int currentIndex = 0;
  ProductDetailsUpdateImageCover({required this.currentIndex});
}
