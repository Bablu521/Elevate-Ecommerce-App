import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_source/products_remote_data_source.dart';
import '../client/api_client.dart';
import '../mapper/categories/product_mapper.dart';

@Injectable(as: ProductsRemoteDataSource)
class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final ApiClient _apiClient;

  ProductsRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<List<ProductEntity>>> getAllProducts() async {
    try {
      final response = await _apiClient.getAllProducts();
      return ApiSuccessResult(
        response.products!.map(ProductMapper.fromDTO).toList(),
      );
    } catch (e) {
      return ApiErrorResult(e);
    }
  }

  @override
  Future<ApiResult<List<ProductEntity>>> getProductsByCategory(
    String category,
  ) async {
    try {
      final response = await _apiClient.getProductsByCategory(category);
      return ApiSuccessResult(
        response.products!.map(ProductMapper.fromDTO).toList(),
      );
    } catch (e) {
      return ApiErrorResult(e);
    }
  }

  @override
  Future<ApiResult<List<ProductEntity>>> getProductsByOccasion(
    String occasion,
  ) async {
    try {
      final response = await _apiClient.getProductsByOccasion(occasion);
      return ApiSuccessResult(
        response.products!.map(ProductMapper.fromDTO).toList(),
      );
    } catch (e) {
      return ApiErrorResult(e);
    }
  }
}
