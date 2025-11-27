import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../../core/enums/product_sort_enum.dart';
import '../entities/product_entity.dart';
import '../repositories/products_repo.dart';

@injectable
class GetAllProductsUseCase {
  final ProductsRepo _productsRepo;

  GetAllProductsUseCase(this._productsRepo);

  Future<ApiResult<List<ProductEntity>>> call({String? search, ProductSortEnum? sort}) async {
    return await _productsRepo.getAllProducts(search: search, sort: sort);
  }
}
