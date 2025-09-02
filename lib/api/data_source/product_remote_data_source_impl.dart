import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/product_remote_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiClient _apiClient;
  ProductRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<List<ProductEntity>>> getProductsByOccasion(
    String occasionId,
  ) async {
    return safeApiCall(
      () => _apiClient.getProductsByOccasion(occasionId),
      (response) => response.products!
              .map((element) => element.toProductEntity())
              .toList(),
    );
  }

    @override
  Future<ApiResult<List<ProductEntity>>> getProductsByCategory(
    String categoryId,
  ) async {
    return safeApiCall(
      () => _apiClient.getProductsByCategory(categoryId),
      (response) => response.products!
              .map((element) => element.toProductEntity())
              .toList(),
    );
  }
}
