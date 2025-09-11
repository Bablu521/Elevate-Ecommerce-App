import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/best_seller_entity.dart';

abstract interface class BestSellerRepo {
  Future<ApiResult<List<BestSellerProductEntity>>> getBestSeller();
}
