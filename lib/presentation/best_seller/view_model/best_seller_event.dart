sealed class BestSellerEvent {}

class GetBestSellerEvent extends BestSellerEvent {}

class BestSellerAddToCartEvent extends BestSellerEvent {
  final String? productId;

  BestSellerAddToCartEvent({required this.productId});
}
