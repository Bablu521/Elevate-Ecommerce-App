sealed class OccasionEvent {}

class OnLoadOccasionListEvent extends OccasionEvent {}

class OnLoadProductListEvent extends OccasionEvent {
  final String occasionId;
  OnLoadProductListEvent(this.occasionId);
}

class OccasionAddToCartEvent extends OccasionEvent {
  final String? productId;
  OccasionAddToCartEvent({required this.productId});
}
