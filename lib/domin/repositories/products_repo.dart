import '../../core/api_result/api_result.dart';
import '../entities/product_entity.dart';

abstract interface class ProductsRepo {
  Future<ApiResult<List<ProductEntity>>> getAllProducts();

  Future<ApiResult<List<ProductEntity>>> getProductsByCategory(String categoryId);

  Future<ApiResult<List<ProductEntity>>> getProductsByOccasion(String occasionId);
}
