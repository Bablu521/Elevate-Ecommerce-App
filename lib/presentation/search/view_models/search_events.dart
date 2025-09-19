sealed class SearchEvents {}

class ProductsSearchEvent extends SearchEvents {}

class ClearProductsSearchEvent extends SearchEvents {}

class SearchAddToCartEvent extends SearchEvents {
  final String? productId;

  SearchAddToCartEvent({required this.productId});
}
