import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_source/products_remote_data_source.dart';
import '../client/api_client.dart';

@Injectable(as: ProductsRemoteDataSource)
class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final ApiClient _apiClient;

  ProductsRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<List<ProductEntity>>> getAllProducts() async {
    return safeApiCall(
      () => _apiClient.getAllProducts(),
      (response) => response.products!.map((dto) => dto.toProductEntity()).toList(),
    );
  }

  @override
  Future<ApiResult<List<ProductEntity>>> getProductsByCategory(
    String category,
  ) async {
    return safeApiCall(
      () => _apiClient.getProductsByCategory(category),
      (response) => response.products!.map((dto) => dto.toProductEntity()).toList(),
    );
  }

  @override
  Future<ApiResult<List<ProductEntity>>> getProductsByOccasion(
    String occasion,
  ) async {
    return safeApiCall(
      () => _apiClient.getProductsByOccasion(occasion),
      (response) => response.products!.map((dto) => dto.toProductEntity()).toList(),
    );
  }

  @override
  Future<ApiResult<List<ProductEntity>>> fetchAllProducts({String? sort, String? search}) {
    return safeApiCall(
        ()=>_apiClient.fetchAllProducts(sort, search),

        (response)=>response.products!.map((dto)=>dto.toProductEntity()).toList(),
    );
  }
}
