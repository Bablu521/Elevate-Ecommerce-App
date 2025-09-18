import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/best_seller_product_entity.dart';

abstract class BestSellerRemoteDataSource {
  Future<ApiResult<List<BestSellerProductEntity>>> getBestSeller();
}
