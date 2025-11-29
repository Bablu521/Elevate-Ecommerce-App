import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

import '../repositories/products_repo.dart';

@injectable
class GetProductsByOccasionUseCase {
  final ProductsRepo _productRepo;
  GetProductsByOccasionUseCase(this._productRepo);

  Future<ApiResult<List<ProductEntity>>> call(String occasionId) {
    return _productRepo.getProductsByOccasion(occasionId);
  }
}
