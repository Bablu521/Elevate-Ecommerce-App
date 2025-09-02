import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';

abstract interface class ProductRemoteDataSource {
  Future<ApiResult<List<ProductEntity>>> getProductsByOccasion(String occasionId);
  Future<ApiResult<List<ProductEntity>>> getProductsByCategory(
    String categoryId,
  );
}