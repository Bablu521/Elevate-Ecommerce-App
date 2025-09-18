import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/mapper/home/best_seller_mapper.dart';
import 'package:elevate_ecommerce_app/api/models/responses/best_seller/best_seller_response_dto.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/best_seller_remote_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/best_seller_product_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BestSellerRemoteDataSource)
class BestSellerRemoteDataSourceImpl extends BestSellerRemoteDataSource {
  final ApiClient _apiClient;
  BestSellerRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<List<BestSellerProductEntity>>> getBestSeller() {
    return safeApiCall<BestSellerResponseDto, List<BestSellerProductEntity>>(
      () => _apiClient.getBestSeller(),
      (response) => response.bestSeller!
          .map((productDto) => productDto.toEntity())
          .toList(),
    );
  }
}
