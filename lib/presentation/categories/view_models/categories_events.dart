sealed class CategoriesEvents {}

class GetCategoriesEvent extends CategoriesEvents {}

class GetAllProductsEvent extends CategoriesEvents {}

class GetProductsByCategoryEvent extends CategoriesEvents {}

class ProductsSearchEvent extends CategoriesEvents {}

class InitTabBarEvent extends CategoriesEvents {}
class CategoriesAddToCartEvent extends CategoriesEvents {
  final String? productId;
  CategoriesAddToCartEvent({required this.productId});
}

