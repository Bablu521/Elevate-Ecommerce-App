import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/best_seller_product_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/best_seller_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetBestSellerUseCase {
  final BestSellerRepo _bestSellerRepo;

  GetBestSellerUseCase(this._bestSellerRepo);
  Future<ApiResult<List<BestSellerProductEntity>>> call() async {
    return await _bestSellerRepo.getBestSeller();
  }
}
