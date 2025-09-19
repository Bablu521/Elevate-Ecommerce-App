import '../../core/api_result/api_result.dart';
import '../../core/enums/product_sort_enum.dart';
import '../entities/product_entity.dart';

abstract interface class ProductsRepo {
  Future<ApiResult<List<ProductEntity>>> getAllProducts({String? search, ProductSortEnum? sort});

  Future<ApiResult<List<ProductEntity>>> getProductsByCategory(String categoryId);

  Future<ApiResult<List<ProductEntity>>> getProductsByOccasion(String occasionId);
}
