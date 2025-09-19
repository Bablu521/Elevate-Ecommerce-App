import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../entities/product_entity.dart';
import '../repositories/products_repo.dart';

@injectable
class FetchAllProductsUseCase {
  final ProductsRepo _productsRepo;

  FetchAllProductsUseCase(this._productsRepo);

  Future<ApiResult<List<ProductEntity>>> call({String? search,String? sort}) async {
    return await _productsRepo.fetchAllProducts(search:search,sort: sort );
  }
}
