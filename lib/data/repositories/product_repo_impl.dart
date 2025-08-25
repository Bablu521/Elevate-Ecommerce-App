import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/product_remote_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/product_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepo)
class ProductRepoImpl implements ProductRepo {
  final ProductRemoteDataSource _productRemoteDataSource;
  ProductRepoImpl(this._productRemoteDataSource);

  @override
  Future<ApiResult<List<ProductEntity>>> getProductsByOccasion(
    String occasionId,
  ) {
    return _productRemoteDataSource.getProductsByOccasion(occasionId);
  }

  @override
  Future<ApiResult<List<ProductEntity>>> getProductsByCategory(
    String categoryId,
  ) {
    return _productRemoteDataSource.getProductsByCategory(categoryId);
  }
}
