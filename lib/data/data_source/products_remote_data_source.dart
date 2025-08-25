import '../../core/api_result/api_result.dart';
import '../../domin/entities/product_entity.dart';

abstract class ProductsRemoteDataSource {
  Future<ApiResult<List<ProductEntity>>> getAllProducts();

  Future<ApiResult<List<ProductEntity>>> getProductsByCategory(String category);

  Future<ApiResult<List<ProductEntity>>> getProductsByOccasion(String occasion);
}
