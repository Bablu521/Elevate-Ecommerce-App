import '../../core/api_result/api_result.dart';
import '../../core/enums/product_sort_enum.dart';
import '../../domin/entities/product_entity.dart';

abstract interface class ProductsRemoteDataSource {
  Future<ApiResult<List<ProductEntity>>> getAllProducts({
    String? search,
    ProductSortEnum? sort,
  });

  Future<ApiResult<List<ProductEntity>>> getProductsByCategory(String category);

  Future<ApiResult<List<ProductEntity>>> getProductsByOccasion(String occasion);
}
