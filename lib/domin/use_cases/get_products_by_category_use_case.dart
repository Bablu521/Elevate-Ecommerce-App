import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/product_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsByCategoryUseCase {
  final ProductRepo _productRepo;
  GetProductsByCategoryUseCase(this._productRepo);

  Future<ApiResult<List<ProductEntity>>> call(String categoryId) {
    return _productRepo.getProductsByCategory(categoryId);
  }
}
