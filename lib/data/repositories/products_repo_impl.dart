import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domin/repositories/products_repo.dart';
import '../data_source/products_remote_data_source.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo {
  final ProductsRemoteDataSource _productsRemoteDataSource;

  ProductsRepoImpl(this._productsRemoteDataSource);

  @override
  Future<ApiResult<List<ProductEntity>>> getAllProducts() {
    return _productsRemoteDataSource.getAllProducts();
  }

  @override
  Future<ApiResult<List<ProductEntity>>> getProductsByCategory(
    String category,
  ) {
    return _productsRemoteDataSource.getProductsByCategory(category);
  }

  @override
  Future<ApiResult<List<ProductEntity>>> getProductsByOccasion(
    String occasion,
  ) {
    return _productsRemoteDataSource.getProductsByOccasion(occasion);
  }
}
