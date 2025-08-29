import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/category_entity.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_source/categories_remote_data_source.dart';
import '../mapper/categories/category_mapper.dart';

@Injectable(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final ApiClient _apiClient;

  CategoriesRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<List<CategoryEntity>>> getAllCategories() {
    return safeApiCall(
          () => _apiClient.getAllCategories(),
          (response) => response.categories!.map(CategoryMapper.fromDTO).toList(),
    );
  }

}
