import '../../../core/enums/product_sort_enum.dart';

sealed class CategoriesEvents {}

class GetCategoriesEvent extends CategoriesEvents {}

class GetAllProductsEvent extends CategoriesEvents {}

class GetProductsByCategoryEvent extends CategoriesEvents {}

class InitTabBarEvent extends CategoriesEvents {}

class CategoriesAddToCartEvent extends CategoriesEvents {
  final String? productId;

  CategoriesAddToCartEvent({required this.productId});
}

class ChangeSelectedFilterEvent extends CategoriesEvents {
  final ProductSortEnum? sort;

  ChangeSelectedFilterEvent({this.sort});
}

class ProductsSortEvent extends CategoriesEvents {}