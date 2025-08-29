import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../entities/product_entity.dart';
import '../repositories/products_repo.dart';

@injectable
class GetProductsByOccasionUseCase {
  final ProductsRepo _productsRepo;

  GetProductsByOccasionUseCase(this._productsRepo);

  Future<ApiResult<List<ProductEntity>>> call(String occasion) async {
    return await _productsRepo.getProductsByOccasion(occasion);
  }
}
