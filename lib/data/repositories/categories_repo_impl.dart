import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/categories_remote_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/category_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domin/repositories/categories_repo.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesRemoteDataSource _categoriesRemoteDataSource;

  CategoriesRepoImpl(this._categoriesRemoteDataSource);

  @override
  Future<ApiResult<List<CategoryEntity>>> getAllCategories() {
    return _categoriesRemoteDataSource.getAllCategories();
  }
}
