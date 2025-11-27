import '../../core/api_result/api_result.dart';
import '../../domin/entities/category_entity.dart';

abstract interface class CategoriesRemoteDataSource {
  Future<ApiResult<List<CategoryEntity>>> getAllCategories();
}
