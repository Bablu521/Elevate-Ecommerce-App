import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../entities/product_entity.dart';
import '../repositories/products_repo.dart';

@injectable
class GetAllProductsUseCase {
  final ProductsRepo _productsRepo;

  GetAllProductsUseCase(this._productsRepo);

  Future<ApiResult<List<ProductEntity>>> call() async {
    return await _productsRepo.getAllProducts();
  }
}
