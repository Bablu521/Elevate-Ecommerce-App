import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../entities/product_entity.dart';
import '../repositories/products_repo.dart';

@injectable
class GetProductsByCategoryUseCase {
  final ProductsRepo _productsRepo;

  GetProductsByCategoryUseCase(this._productsRepo);

  Future<ApiResult<List<ProductEntity>>> call(String category) async {
    return await _productsRepo.getProductsByCategory(category);
  }
}
